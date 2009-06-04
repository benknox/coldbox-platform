<!-----------------------------------------------------------------------
********************************************************************************
Copyright 2009 Reactor Loader by Mark Drew and Railo Technologies
www.reactorframework.com | www.markdrew.co.uk | www.getrailo.com
********************************************************************************
Template : ReactorLoader.cfc
Author 	 : Mark Drew, Luis Majano
Date     : 2009-05-29
Description :
	
	This loader  is used to create Reactor and load it
	
---------------------------------------------------------------------->
<cfcomponent name="ReactorLoader"
			 hint="Creates Reactor and caches it within ColdBox" 
			 output="false"
			 extends="coldbox.system.Interceptor">
<!---
	CONSTRUCTOR
--->	
	
	<cffunction name="Configure" access="public" returntype="void" hint="This is the configuration method for your interceptors" output="false" >
	
	<!---
		Property checks, since these need to be defined for Reactor to work
	--->
	
	<cfscript >
		/* Property Checks */
		if( not propertyExists('dsn') ){
			throw("No datasource name passed","Please pass in the name of the datasource to use");
		}
		if( not propertyExists('pathToConfigXml') ){
			throw("No pathToConfigXML passed","Please pass in the location of the pathToConfigXml");
		}
		if( not propertyExists('project') ){
			throw("No project name passed","Please pass in the name of the project to use");
		}
		if( not propertyExists('type') ){
			throw("No type passed","Please pass in the database type");
		}
		if( not propertyExists('mapping') ){
			throw("No mapping passed","Please pass in the mapping location");
		}
		if( not propertyExists('mode') ){
			throw("No mode passed","Please pass in the mode to use");
		}
		
		/* Optional Properties */
		if( not propertyExists('ReactorCacheKey') ){
			setProperty('ReactorCacheKey',"Reactor");
		}
		if( not propertyExists('ReactorConfigClassPath') ){
			setProperty('ReactorConfigClassPath',"reactor.config.config");
		}
		if( not propertyExists('ReactorFactoryClassPath') ){
			setProperty('ReactorFactoryClassPath',"reactor.reactorFactory");
		}
	</cfscript>
	
	</cffunction>
	
	
	<cffunction name="afterConfigurationLoad" output="false" access="public" returntype="void" hint="Load Reactor after configuration has loaded">
		<!--- *********************************************************************** --->
		<cfargument name="event" 			required="true" type="any" hint="The event object: coldbox.system.beans.RequestContext">
		<cfargument name="interceptData" 	required="true" type="struct" hint="A structure containing intercepted information. NONE BY DEFAULT HERE">
		<!--- *********************************************************************** --->
		
		<cfscript >
			var reactorConfig = CreateObject("component", getProperty("ReactorConfigClassPath")).init(getProperty("pathToConfigXml")); 
			var reactor = CreateObject("component", getProperty("ReactorFactoryClassPath"));
				reactorConfig.setDsn(getProperty("dsn"));
				reactorConfig.setProject(getProperty("project"));
				reactorConfig.setType(getProperty("type"));
				reactorConfig.setMapping(getProperty("mapping"));
				reactorConfig.setMode(getProperty("mode"));
				
			reactor.init(reactorConfig);
			
			//Now cache it as a singleton
			getColdboxOCM().set(getProperty('ReactorCacheKey'), reactor,0);
		</cfscript>
	
	</cffunction>
	
</cfcomponent>