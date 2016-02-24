var app = angular.module('workout-app', ['ngRoute', 'ngStorage']);

/* Route Controller
 */
app.config(function($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'login.html'
    })
    .when('/workoutList', {
      templateUrl: 'workoutList.html'
    })
    .when('/workoutHistory', {
      templateUrl: 'workoutHistory.html'
    })
    .when('/workoutHelp', {
      templateUrl: 'workoutHelp.html'
    })
    .when('/workout', {
      templateUrl: 'workout.html'
    });
}).run(function($location) {

});

/* Main Site Controller -
 */
app.controller('main', function($scope, $rootScope, $http, $location) {
  updateRootScopes($rootScope);

  // Timer Click Event
  $rootScope.timerStarted = false;
  $rootScope.timer = function () {
    if ($rootScope.timerStarted) {
      $('#countdown').stop();
      $rootScope.timerStarted = false;
    } else {
      $('#countdown').destroy();
      $('#countdown').countup();
      $rootScope.timerStarted = true;
    }
  }

  // Go To Login page if not logged in
  $scope.$watch(function() {
    return $location.path();
  }, function(newValue, oldValue) {
    if (!loggedIn() && newValue != '/') {
      $location.path('/');
    }
  });

  // Logout Function
  $scope.proccessLogout = function() {
    deleteCookie('user');
    $location.path("/");
  }
});

/* Login Controller -
 */
app.controller('login', function($scope, $rootScope, $http, $location) {
  updateRootScopes($rootScope);

  if (loggedIn()) {
    $location.path("/workoutList/");
  }

  $scope.check_credentials = function() {
    $scope.showError = false;

    var request = $http({
      method: "post",
      url: "api/login.php",
      data: {
        user: $scope.user,
        pass: $scope.password
      },
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    });

    request.success(function(data) {
      var userObject = data;
      // Change Location if Credentials valid
      if (userObject[0]) {
        // Store Cookie Credentials
        setCookie("user", JSON.stringify(userObject[0]));
        $location.path("/workoutList/");
      } else {
        $scope.showError = true;
      }
    });
  }
});

/* workoutList Controller -
 */
app.controller('workoutList', function($scope, $rootScope, $http) {
  updateRootScopes($rootScope);

  var request = $http({
    method: "post",
    url: "api/workoutList.php",
    data: {},
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  });
  request.success(function(data) {
    $scope.workoutList = data;
    $scope.ordergroupId = function(workoutList) {
      return parseInt(workoutList.groupingId);
    };
    $scope.orderOrderId = function(workoutList) {
      return parseInt(workoutList.orderId);
    };
  });
});

/* workoutHistory Controller -
 */
app.controller('workoutHistory', function($scope, $rootScope, $http) {
  updateRootScopes($rootScope);
  $scope.userId = loggedIn().id;
  // Table Variables
  $scope.sortType = 'dateTime'; // Default Sort
  $scope.sortReverse = false;
  $scope.searchWorkoutHistory = '';

  $scope.orderTable = function(workoutHistoryList) {
    if ($scope.sortType == 'amount' ||
      $scope.sortType == 'reps' ||
      $scope.sortType == 'repsRequired' ||
      $scope.sortType == 'setNum') {
      return parseInt(workoutHistoryList[$scope.sortType]);
    } else if ($scope.sortType == 'dateTime') {
      return Date.parse(workoutHistoryList[$scope.sortType]);
    } else {
      return (workoutHistoryList[$scope.sortType]);
    }
  };

  var request = $http({
    method: "post",
    url: "api/workoutHistory.php",
    data: {
      userId: $scope.userId
    },
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  });
  request.success(function(data) {
    $scope.workoutHistoryList = data;
  });
});

/* workout Controller -
 */
app.controller('workout', function($scope, $rootScope, $http,
  $location, $localStorage) {
  updateRootScopes($rootScope);
  $scope.workoutListId = $location.search()['id'];
  $scope.userId = loggedIn().id;
  var credentialsId = "cred-" + $scope.userId + "-" + $scope.workoutListId;
  var workoutFormId = "workoutForm-" + credentialsId;

  // Request
  var request = $http({
    method: "post",
    url: "api/workout.php",
    data: {
      workoutListId: $scope.workoutListId,
      userId: $scope.userId
    },
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  });
  request.success(function(data) {
    $scope.workoutList = data;
    // Order Workout
    $scope.orderWorkout = function(workoutList) {
      return parseInt(workoutList.workoutOrder);
    };
  });


  // Workout Form Input
  $scope.workoutForm = {};

  /* Local Storage save if leave form before submit*/
  if ($localStorage[workoutFormId]) {
    $scope.$storage = $localStorage;
    $scope.workoutForm = $scope.$storage[workoutFormId];
  } else {
    $scope.$storage = $localStorage.$default({});
    $scope.$storage[workoutFormId] = $scope.workoutForm;
  }

  $scope.proccessWorkoutForm = function() {
      $scope.showError = false;
      if (!$scope.workoutFormName.$valid) {
        $scope.showError = true;
      } else {

        $scope.workoutForm.userId = loggedIn().id;
        $http({
            method: 'POST',
            url: 'api/workoutForm.php',
            data: $.param($scope.workoutForm),
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded'
            }
          })
          .success(function(data) {
            $scope.$storage[workoutFormId] = null;
            $localStorage[workoutFormId] = null;
            //not working window.localStorage.removeItem('ngStorage-'+workoutFormId);
            $location.path("/workoutList/");
          })
      }
    }

    // Toggle Previous Data
  $scope.togglePrevious = function(id) {
    var showPrev = "showPrev" + id;
    $scope[showPrev] = ($scope[showPrev]) ? false : true;
  }

  $scope.convertToInt = function(val) {
    return parseInt(val);
  }

});


/* Update Root Scope Variables
 */
function updateRootScopes(rootScope) {
  rootScope.userName = (loggedIn()) ? 'Bodies by ' + loggedIn().name : 'Bodies';
}

/* Return null if not logged in else return Object
 */
function loggedIn() {
  return JSON.parse(getCookie("user"));
}

/* Get Cookie Value
 */
function getCookie(name) {
  var cookies = document.cookie.split(";")
  for (var i = 0; i < cookies.length; i++) {
    var cookie = cookies[i].split("=")
    if (name == cookie[0])
      return cookie[1];
  }
  return null;
};

/* Set Cookie Value default 1 hr expire time
 */
function setCookie(key, val, days) {
  days = days || 0.25; // 6 hrs
  var date = new Date();
  date.setTime(+date + (days * 86400000));
  document.cookie = key + "=" + val + "; expires=" + date.toGMTString() + "";
}

/* Remove cookie
 */
function deleteCookie(name) {
  setCookie(name, "", -1);
}

/* Remove Local Storage key
*/
function clearLocalStorage(startsWith) {
    startsWith = "ngStorage-" + startsWith;
    var myLength = startsWith.length;

    Object.keys(localStorage)
        .forEach(function(key){
            if (key.substring(0,myLength) == startsWith) {
                localStorage.removeItem(key);
            }
        });
}
