docpadUtil = require('../util')
isUser = docpadUtil.isUser()

module.exports = {
	# -----------------------------
	# Plugins

	# Force re-install of all plugin dependencies
	force: false

	# Whether or not we should use the global docpad instance
	global: false

	# Whether or not we should enable plugins that have not been listed or not
	enableUnlistedPlugins: true

	# Plugins which should be enabled or not pluginName: pluginEnabled
	enabledPlugins: {}

	# Whether or not we should skip unsupported plugins
	skipUnsupportedPlugins: true

	# Whether or not to warn about uncompiled private plugins
	warnUncompiledPrivatePlugins: true

	# Configuration to pass to any plugins pluginName: pluginConfiguration
	plugins: {}


	# -----------------------------
	# Project Paths

	# The project directory
	rootPath: process.cwd()

	# The project's database cache path
	databaseCachePath: '.docpad.db'

	# The project's package.json path
	packagePath: 'package.json'

	# The project's configuration paths
	# Reads only the first one that exists
	# If you want to read multiple configuration paths, then point it to a coffee|js file that requires
	# the other paths you want and exports the merged config
	configPaths: [
		'docpad.js'
		'docpad.coffee'
		'docpad.json'
		'docpad.cson'
	]

	# Plugin directories to load
	pluginPaths: []

	# The project's plugins directory
	pluginsPaths: [
		'node_modules'
		'plugins'
	]

	# Paths that we should watch for reload changes in
	reloadPaths: []

	# Paths that we should watch for regeneration changes in
	regeneratePaths: []

	# The time to wait after a source file has changed before using it to regenerate
	regenerateDelay: 100

	# The time to wait before outputting the files we are waiting on
	slowFilesDelay: 20*1000

	# The project's out directory
	outPath: 'out'

	# The project's src directory
	srcPath: 'src'

	# The project's documents directories
	# relative to the srcPath
	documentsPaths: [
		'documents'
		'render'
	]

	# The project's files directories
	# relative to the srcPath
	filesPaths: [
		'files'
		'static'
		'public'
	]

	# The project's layouts directory
	# relative to the srcPath
	layoutsPaths: [
		'layouts'
	]

	# Ignored file patterns during directory parsing
	ignorePaths: false
	ignoreHiddenFiles: false
	ignoreCommonPatterns: true
	ignoreCustomPatterns: false

	# Watch options
	watchOptions: null


	# -----------------------------
	# Server

	# Port
	# The port that the server should use
	# Defaults to these environment variables:
	# - PORT — Heroku, Nodejitsu, Custom
	# - VCAP_APP_PORT — AppFog
	# - VMC_APP_PORT — CloudFoundry
	port: null

	# Hostname
	# The hostname we wish to listen to
	# Defaults to these environment variables:
	# HOSTNAME — Generic
	# Do not set to "localhost" it does not work on heroku
	hostname: null

	# Max Age
	# The caching time limit that is sent to the client
	maxAge: 86400000

	# Server
	# The Express.js server that we want docpad to use
	serverExpress: null
	# The HTTP server that we want docpad to use
	serverHttp: null

	# Extend Server
	# Whether or not we should extend the server with extra middleware and routing
	extendServer: true

	# Which middlewares would you like us to activate
	# The standard middlewares (bodyParser, methodOverride, express router)
	middlewareStandard: true
	# The standard bodyParser middleware
	middlewareBodyParser: true
	# The standard methodOverride middleware
	middlewareMethodOverride: true
	# The standard express router middleware
	middlewareExpressRouter: true
	# Our own 404 middleware
	middleware404: true
	# Our own 500 middleware
	middleware500: true


	# -----------------------------
	# Logging

	# Log Level
	# Which level of logging should we actually output
	logLevel: (if ('-d' in process.argv) then 7 else 6)

	# Catch uncaught exceptions
	catchExceptions: true

	# Report Errors
	# Whether or not we should report our errors back to DocPad
	# By default it is only enabled if we are not running inside a test
	reportErrors: process.argv.join('').indexOf('test') is -1

	# Report Statistics
	# Whether or not we should report statistics back to DocPad
	# By default it is only enabled if we are not running inside a test
	reportStatistics: process.argv.join('').indexOf('test') is -1

	# Color
	# Whether or not our terminal output should have color
	# `null` will default to what the terminal supports
	color: null


	# -----------------------------
	# Other

	# Utilise the database cache
	databaseCache: false  # [false, true, 'write']

	# Detect Encoding
	# Should we attempt to auto detect the encoding of our files?
	# Useful when you are using foreign encoding (e.g. GBK) for your files
	detectEncoding: false

	# Render Single Extensions
	# Whether or not we should render single extensions by default
	renderSingleExtensions: false

	# Render Passes
	# How many times should we render documents that reference other documents?
	renderPasses: 1

	# Offline
	# Whether or not we should run in offline mode
	# Offline will disable the following:
	# - checkVersion
	# - reportErrors
	# - reportStatistics
	offline: false

	# Check Version
	# Whether or not to check for newer versions of DocPad
	checkVersion: false

	# Welcome
	# Whether or not we should display any custom welcome callbacks
	welcome: false

	# Prompts
	# Whether or not we should display any prompts
	prompts: false

	# Progress
	# Whether or not we should display any progress bars
	# Requires prompts being true, and log level 6 or above
	progress: true

	# Powered By DocPad
	# Whether or not we should include DocPad in the Powered-By meta header
	# Please leave this enabled as it is a standard practice and promotes DocPad in the web eco-system
	poweredByDocPad: true

	# Helper Url
	# Used for subscribing to newsletter, account information, and statistics etc
	# Helper's source-code can be found at: https://github.com/docpad/helper
	helperUrl: if true then 'http://helper.docpad.org/' else 'http://localhost:8000/'

	# Safe Mode
	# If enabled, we will try our best to sandbox our template rendering so that they cannot modify things outside of them
	# Not yet implemented
	safeMode: false

	# Template Data
	# What data would you like to expose to your templates
	templateData: {}

	# Collections
	# A hash of functions that create collections
	collections: {}

	# Events
	# A hash of event handlers
	events: {}

	# Regenerate Every
	# Performs a regenerate every x milliseconds, useful for always having the latest data
	regenerateEvery: false

	# Regerenate Every Options
	# The generate options to use on the regenerate every call
	regenerateEveryOptions:
		populate: true
		partial:  false


	# -----------------------------
	# Environment Configuration

	# Locale Code
	# The code we shall use for our locale (e.g. en, fr, etc)
	localeCode: null

	# Environment
	# Whether or not we are in production or development
	# Separate environments using a comma or a space
	env: null

	# Environments
	# Environment specific configuration to over-ride the global configuration
	environments:
		development:
			# Always refresh from server
			maxAge: false

			# Only do these if we are running standalone (aka not included in a module)
			checkVersion: isUser
			welcome: isUser
			prompts: isUser
}
