﻿/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* ---
* ContentBox Core module configuration
*/
component {

	// Module Properties
	this.title 				= "ContentBox Core";
	this.author 			= "Ortus Solutions, Corp";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "This is the core module used to power the admin, RESTful and UI modules";
	this.version			= "3.1.0+@build.number@";
	this.viewParentLookup 	= true;
	this.layoutParentLookup = true;
	this.entryPoint			= "cbcore";
	this.modelNamespace 	= "cb";
	this.dependencies 		= [ "cborm", "cbmailservices", "cbstorages", "cbantisamy", "cbfeeds", "cbmessagebox", "cbsecurity", "bcrypt", "cbmarkdown" ];
	this.cfmapping 			= "contentbox";

	function configure(){
		// contentbox settings
		settings = {
			codename 			= "Psalm 144:1",
			codenameLink 		= "https://www.bible.com/bible/114/psa.144.1.nkjv",
			// Auto Updates
			updateSlug_stable 	= "contentbox-stable-updates",
			updateSlug_beta 	= "contentbox-beta-updates",
			updatesURL			= "http://www.coldbox.org/api/forgebox",
			// Officially supported languages for modules
			languages 			= [ "de_DE", "en_US", "es_SV", "it_IT", "pt_BR" ]
		};
		
		// i18n
		i18n = {
			resourceBundles = {
		    	"cbcore" = "#moduleMapping#/i18n/cbcore"
		  	},
		  	defaultLocale = "en_US",
		  	localeStorage = "cookie"
		};

		// CB Module Conventions
		conventions = {
			layoutsLocation = "themes",
			viewsLocation 	= "themes"
		};

		// Parent Affected Settings
		parentSettings = {
			// File Browser module name override
			filebrowser_module_name		= "contentbox-filebrowser",
			// The default HTMl template for emitting the messages
			messagebox = {
				template = "#moduleMapping#/models/ui/templates/messagebox.cfm"
			}
		};

		// interceptor settings
		interceptorSettings = {
			// ContentBox Custom Events
			customInterceptionPoints = arrayToList([
				// Code Rendering
				"cb_onContentRendering", "cb_onContentStoreRendering"
			])
		};

		// interceptors
		interceptors = [
			// Rate Limiter
			{ class="contentbox.models.security.RateLimiter", name="RateLimiter@cb" },
			// CB RSS Cache Cleanup Ghost
			{ class="contentbox.models.rss.RSSCacheCleanup", name="RSSCacheCleanup@cb" },
			// CB Content Cache Cleanup Ghost
			{ class="contentbox.models.content.util.ContentCacheCleanup", name="ContentCacheCleanup@cb" },
			// Content Subscriptions
			{ class="contentbox.models.subscriptions.SubscriptionListener", name="SubscriptionListener@cb" },
			// Content Renderers, remember order is important.
			{ class="contentbox.models.content.renderers.LinkRenderer", name="LinkRenderer@cb" },
			{ class="contentbox.models.content.renderers.WidgetRenderer", name="WidgetRenderer@cb" },
			{ class="contentbox.models.content.renderers.SettingRenderer", name="SettingRenderer@cb" },
			{ class="contentbox.models.content.renderers.MarkdownRenderer", name="MarkdownRenderer@cb" }
		];

		// Manual Mappings
		binder.map( "customFieldService@cb" ).toDSL( "entityService:cbCustomField" );

		// ColdBox Integrations
		binder.map( "ColdBoxRenderer" ).toDSL( "coldbox:Renderer" );
		binder.map( "SystemUtil@cb" ).to( "coldbox.system.core.util.Util" );
		binder.map( "FileUtils@cb" ).to( "coldbox.system.core.util.FileUtils" );
		
	}
	
	/**
	* Development tier
	*/
	function development(){
	}

	/**
	* Multi-domain hosting, in preparation for multi-site domains
	* This is for both the admin and UI modules
	*/
	function preProcess( event ){
		// find appmaping
		var appMapping = ( len( controller.getSetting( 'AppMapping' ) ) ? controller.getSetting( 'AppMapping' ) & "/" : "" );
		// Setup base URL
		event.setSESBaseURL( "http" & ( event.isSSL() ? "s" : "" ) & "://#cgi.HTTP_HOST#/#appMapping#" );
	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		// Startup the ContentBox modules, if any
		wirebox.getInstance( "moduleService@cb" ).startup();
		// Startup localization settings
		if( controller.getSetting( 'using_i18n' ) ){
			// Load resource bundles here when ready
		} else{
			// Parent app does not have i18n configured, so add settings manually
			controller.setSetting( 'LocaleStorage', 'cookie' );
			// Add Back when Ready -> controller.setSetting( 'defaultResourceBundle', moduleMapping & '/includes/i18n/main' );
			controller.setSetting( 'defaultLocale', "en_US" );
		}
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
	}

	/************************************** PRIVATE *********************************************/

}