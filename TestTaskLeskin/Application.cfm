<cfapplication name="Bugs"  
    sessionmanagement="Yes"> 
  
<cfset app_is_initialized = False> 
 
<cflock scope="application" type="readonly" timeout=10> 
     <cfset app_is_initialized = IsDefined("Application.initialized")> 
</cflock> 
 
<cfif not app_is_initialized>  
    <cflock scope="application" type="exclusive" timeout=10>  
        <cfif not IsDefined("Application.initialized")> 
            <cfset Application.ReadOnlyData.Bugs = "Bugs">  
            <cfset Application.initialized = "yes"> 
        </cfif> 
    </cflock> 
</cfif> 
 
<cflock timeout="20" scope="Session" type="exclusive"> 
    <cfif not IsDefined("Session.user_id")> 
        <cfset Session.user_id=0>
        <cfset Session.login=""> 
        <cfset Session.first_name=""> 
        <cfset Session.last_name="">  
    <cfelse> 
        <cfset Session.user_id=Session.user_id> 
    </cfif> 
</cflock> 