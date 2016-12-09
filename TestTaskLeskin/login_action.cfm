<body class="main_wrapper">
	<cfset md5pass=Hash(#form.password#)>
	
	<!--- Check if there is a user with that login and password --->
	<cfquery name="login" datasource="mydata">
		SELECT user_id, first_name, last_name, login FROM users WHERE login=<cfqueryparam value="#form.login#" cfsqltype="cf_sql_varchar" />
		 AND password=<cfqueryparam value="#md5pass#" cfsqltype="cf_sql_varchar" />
	</cfquery>
	<cfif login.RecordCount GT 0> 
	    <cflock timeout=20 scope="Session" type="Exclusive"> 
		    <cfset Session.user_id = #login.user_id#>
		    <cfset Session.first_name = #login.first_name#>
		    <cfset Session.last_name = #login.last_name#>
		    <cfset Session.login = #login.login#>
		    <cfoutput >
	    		<cfinclude template="menu.cfm" >
		    	You've logged in as #login.first_name# #login.last_name#!
		    </cfoutput> 
		</cflock>
	<cfelse>
			<cfoutput >
				<cfinclude template="menu.cfm" >
				Invalid login or password
			</cfoutput>
	</cfif>
</body>