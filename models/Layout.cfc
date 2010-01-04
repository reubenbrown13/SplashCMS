<cfcomponent extends="Model" output="false">

	<cffunction name="init">
        <cfset hasMany("pages")>

        <cfset validatesPresenceOf(property="name" , message="Your layout must have a name.")>
        <cfset validatesPresenceOf(property="content" , message="Your layout must have a body.")>
        <cfset validatesLengthOf(property="name", maximum="100", message="Your layout name exceeds 100 characters.", allowBlank="true")>

        <cfset beforeCreate('setCreatedByID')>
        <cfset beforeUpdate('setUpdatedByID,deleteOldFile')>
	    <cfset afterCreate('write')>
	    <cfset afterUpdate('write')>
	</cffunction>
	
</cfcomponent>
