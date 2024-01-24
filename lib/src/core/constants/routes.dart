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
    * /home/schedules
    * /home/teachers
    * /home/exams
    * /home/news
    * /home/settings

  Admin:
    * /admin/schedules
    * /admin/teachers
    * /admin/exams
    * /admin/news
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

/// The path to the main page.
const String homePageRouteKey = '/home';

/// The path to the admin panel.
const String adminPanelPageRouteKey = '/admin';

/// The path to the page for viewing the schedule.
const String schedulesPageRouteKey = 'schedules';

/// The path to the page for viewing the teacher's schedule.
const String teachersPageRouteKey = 'teachers';

/// The path to the page for viewing the exam schedule.
const String examsPageRouteKey = 'exams';

/// The path to the news viewing page.
const String newsPageRouteKey = 'news';

/// The path to the settings page.
const String settingsPageRouteKey = 'settings';

/// Composite home path for viewing the schedule.
const String homeSchedulesPageRouteKey =
    '$homePageRouteKey/$schedulesPageRouteKey';

/// Composite home path for viewing teachers' schedules.
const String homeTeachersPageRouteKey =
    '$homePageRouteKey/$teachersPageRouteKey';

/// Composite home path for viewing exam schedules.
const String homeExamsPageRouteKey = '$homePageRouteKey/$examsPageRouteKey';

/// Composite home path for viewing news.
const String homeNewsPageRouteKey = '$homePageRouteKey/$newsPageRouteKey';

/// Composite home path to settings.
const String homeSettingsPageRouteKey =
    '$homePageRouteKey/$settingsPageRouteKey';

/// Composite admin path for schedule editing.
const String adminSchedulesPageRouteKey =
    '$adminPanelPageRouteKey/$schedulesPageRouteKey';

/// Composite admin path for editing teacher schedules.
const String adminTeachersPageRouteKey =
    '$adminPanelPageRouteKey/$teachersPageRouteKey';

/// Composite admin path for editing exam schedules.
const String adminExamsPageRouteKey =
    '$adminPanelPageRouteKey/$examsPageRouteKey';

/// Composite admin path for editing news.
const String adminNewsPageRouteKey =
    '$adminPanelPageRouteKey/$newsPageRouteKey';
