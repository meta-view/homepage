#!/bin/sh
cat << EOF
baseurl = "https://$APP_URL/"
title = "$APP_TITLE"

enableRobotsTXT = true

# Hugo allows theme composition (and inheritance). The precedence is from left to right.
theme = ["docsy"]

# Will give values to .Lastmod etc.
enableGitInfo = true

# Language settings
contentDir = "content/en"
defaultContentLanguage = "en"
defaultContentLanguageInSubdir = false
# Useful when translating.
enableMissingTranslationPlaceholders = true

disableKinds = ["taxonomy", "taxonomyTerm"]

# Highlighting config
pygmentsCodeFences = true
pygmentsUseClasses = false
# Use the new Chroma Go highlighter in Hugo.
pygmentsUseClassic = false
#pygmentsOptions = "linenos=table"
# See https://help.farbox.com/pygments.html
pygmentsStyle = "tango"

# Configure how URLs look like per section.
[permalinks]
blog = "/:section/:year/:month/:day/:slug/"

## Configuration for BlackFriday markdown parser: https://github.com/russross/blackfriday
[blackfriday]
plainIDAnchors = true
hrefTargetBlank = true
angledQuotes = false
latexDashes = true

# Image processing configuration.
[imaging]
resampleFilter = "CatmullRom"
quality = 75
anchor = "smart"

[services]
[services.googleAnalytics]
# Comment out the next line to disable GA tracking. Also disables the feature described in [params.ui.feedback].
#id = "UA-00000000-0"

# Language configuration

[languages]
[languages.en]
title = "Goldydocs"
description = "A Docsy example site"
languageName ="English"
# Weight used for sorting.
weight = 1
contentDir = "content/no"
time_format_default = "02.01.2006"
time_format_blog = "02.01.2006"

[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true

# Everything below this are Site Params

[params]
copyright = "The Docsy Authors"
privacy_policy = "https://policies.google.com/privacy"

# First one is picked as the Twitter card image if not set on page.
# images = ["images/project-illustration.png"]

# Menu title if your navbar has a versions selector to access old versions of your site.
# This menu appears only if you have at least one [params.versions] set.
version_menu = "Releases"

# Repository configuration (URLs for in-page links to opening issues and suggesting changes)
github_repo = "https://git-lab.de/meta-view/homepage.git"
# An optional link to a related project repo. For example, the sibling repository where your product code lives.
github_project_repo = "https://git-lab.de/meta-view/homepage"

# Specify a value here if your content directory is not in your repo's root directory
# github_subdir = ""

# Google Custom Search Engine ID. Remove or comment out to disable search.
#gcs_engine_id = "011737558837375720776:fsdu1nryfng"

# Enable Algolia DocSearch
algolia_docsearch = false

# Enable Lunr.js offline search
offlineSearch = false

# User interface configuration
[params.ui]
# Enable to show the side bar menu in its compact state.
sidebar_menu_compact = false
#  Set to true to disable breadcrumb navigation.
breadcrumb_disable = false
#  Set to true to hide the sidebar search box (the top nav search box will still be displayed if search is enabled)
sidebar_search_disable = false
#  Set to false if you don't want to display a logo (/assets/icons/logo.svg) in the top nav bar
navbar_logo = true
# Set to true to disable the About link in the site footer
footer_about_disable = false

# Adds a H2 section titled "Feedback" to the bottom of each doc. The responses are sent to Google Analytics as events.
# This feature depends on [services.googleAnalytics] and will be disabled if "services.googleAnalytics.id" is not set.
# If you want this feature, but occasionally need to remove the "Feedback" section from a single page,
# add "hide_feedback: true" to the page's front matter.
[params.ui.feedback]
enable = true
# The responses that the user sees after clicking "yes" (the page was helpful) or "no" (the page was not helpful).
yes = 'Glad to hear it! Please <a href="https://github.com/USERNAME/REPOSITORY/issues/new">tell us how we can improve</a>.'
no = 'Sorry to hear that. Please <a href="https://github.com/USERNAME/REPOSITORY/issues/new">tell us how we can improve</a>.'

[params.links]
# End user relevant links. These will show up on left side of footer and in the community page if you have one.
[[params.links.user]]
	name ="@_meta_view"
	url = "twitter.com/_meta_view"
	icon = "fab fa-twitter"
        desc = "Follow us on Twitter to get the latest news!"
# Developer relevant links. These will show up on right side of footer and in the community page if you have one.
[[params.links.developer]]
	name = "GitHub"
	url = "https://github.com/phaus/meta-view-service/"
	icon = "fab fa-github"
        desc = "Development takes place here!"

EOF
