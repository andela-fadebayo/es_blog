angular.module('ceeBlogApp')
  .controller('blogCtrl', ['$scope', function ($scope) {
    console.log('Blog controller running...');

    $scope.test = 'I am working now!';
}]);