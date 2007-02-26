<?xml version="1.0" encoding="ISO-8859-1"?><Config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 	xsi:noNamespaceSchemaLocation="http://www.coldboxframework.com/schema/config_1.2.0.xsd">	<Settings>		<Setting name="AppName" 					value="BlogCFC"/>		<Setting name="DebugMode" 					value="true" />		<Setting name="DebugPassword" 				value="coldbox"/>		<Setting name="EnableDumpVar"				value="true" />				<Setting name="EnableColdfusionLogging" 	value="false" />		<Setting name="EnableColdboxLogging" 		value="true" />		<Setting name="ColdboxLogsLocation"  		value="logs" />		<Setting name="DefaultEvent" 				value="ehBlog.dspBlog"/>		<Setting name="RequestStartHandler" 		value="ehBlog.onRequestStart"/>		<Setting name="RequestEndHandler"			value=""/>		<Setting name="ApplicationStartHandler" 	value="ehBlog.onAppStart" />		<Setting name="OwnerEmail"					value="myemail@email.com" />		<Setting name="EnableBugReports" 			value="false"/>		<Setting name="UDFLibraryFile" 				value="includes/udf.cfm" />		<Setting name="CustomErrorTemplate"			value="views/vwError.cfm" />		<Setting name="ExceptionHandler" 			value=""/>		<Setting name="onInvalidEvent"				value="ehBlog.dspBlog" />		<Setting name="MessageboxStyleClass" 		value=""/>		<Setting name="HandlersIndexAutoReload" 	value="false"/>		<Setting name="ConfigAutoReload" 			value="false"/>		<Setting name="HandlerCaching"				value="true" />	</Settings>		<!-- Your own custom settings -->	<YourSettings />		<!--Optional,if blank it will use the CFMX administrator settings.-->	<MailServerSettings />		<!--Emails to Send bug reports-->	<BugTracerReports>			</BugTracerReports>		<!--List url dev environments, this determines your dev/pro environment-->	<DevEnvironments>		<url>localhost</url>		<url>dev</url>		<url>lmajano</url>		<url>jfetmac</url>	</DevEnvironments>		<WebServices />		<Layouts>		<DefaultLayout>Layout.Main.cfm</DefaultLayout>		<Layout file="Layout.Open.cfm" name="open">			<View>vwPrint</View>			<View>vwAddcomment</View>			<View>vwTrackbacks</View>			<View>vwEditor</View>		</Layout>	</Layouts>		<i18N>
		<DefaultResourceBundle>includes/main</DefaultResourceBundle>		<DefaultLocale>en_US</DefaultLocale>		<LocaleStorage>session</LocaleStorage>
	</i18N>		<Datasources>
		
	</Datasources>	</Config>