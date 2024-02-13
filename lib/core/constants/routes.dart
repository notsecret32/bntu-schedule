/*
  This file stores the paths to different screens. There is a small feature
  here that is worth mentioning. This file stores the paths to different
  screens. There is a small feature here that is worth mentioning.

  The application uses nested paths, for example, `/home/schedule`. These
  nested paths are used in 2 cases:
    1. When using the basic functionality
    2. When the admin panel is used

  Below is a list of all available paths.

  Home:
    * /schedules/:group_number
    * /schedules/settings

  Admin:
    * /admin/schedules/:group_number
    * /admin/settings

  There are also the usual nested paths in the application. 
  
  Here is a list of non-nested paths:
    * /
    * /select-group
    * /admin-login
*/

/// The main path of the application, the application is launched from it.
const String welcomePageRouteKey = '/';

/// The path to select the group.
const String selectGroupPageRouteKey = '/select-group';

/// The path for authorization as an administrator
const String adminLoginPageRouteKey = '/admin-login';

/// The path to the admin panel.
const String adminPanelPageRouteKey = '/admin';

/// The path to the page for viewing the schedule.
const String schedulesPageRouteKey = '/schedules';

/// The path to the settings page.
const String settingsPageRouteKey = 'settings';

/// Composite home path to settings.
const String homeSettingsPageRouteKey =
    '$schedulesPageRouteKey/$settingsPageRouteKey';

/// Composite admin path for schedule editing.
const String adminSchedulesPageRouteKey =
    '$adminPanelPageRouteKey/$schedulesPageRouteKey';
