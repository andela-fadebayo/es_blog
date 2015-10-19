var app = angular.module('ceeBlogApp', [
    'templates'
])
  .config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
}])
  .run(function () {
    console.log('CeeBlog angular app is running...');
});