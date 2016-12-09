<!--- Checking if user is logged as admin --->
<cfif not IsDefined("Session.login") >
	<cfoutput >
		<a href="login.cfm">
			Authorize first
		</a>
		<cfexit />
	</cfoutput>
<cfelseif #Session.login# NOT EQUAL 'admin'>
	<cfoutput >
		<a href="login.cfm">
			You must be logged in as admin
		</a>
		<cfexit />
	</cfoutput>
</cfif>
<!--- /Checking if user is logged as admin --->


<cfquery name="edit_user_query" datasource="mydata">
	 UPDATE users SET first_name= <cfqueryparam value="#form.first_name#" cfsqltype="cf_sql_varchar" />,
	 				 last_name = <cfqueryparam value="#form.last_name#" cfsqltype="cf_sql_varchar" />
	 WHERE user_id = <cfqueryparam value="#form.user_id#"  >
</cfquery>

<cflocation url="users.cfm" addtoken="false" >