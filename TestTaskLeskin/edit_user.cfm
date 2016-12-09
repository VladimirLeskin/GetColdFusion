<body class="main_wrapper">
<cfinclude template="menu.cfm" > 
<!--- Checking if user is logged as admin --->
<cfif not IsDefined("Session.login")>
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

<!--- Get user info --->
<cfquery name="user_info" datasource="mydata">
	SELECT login, first_name, last_name
	FROM users WHERE user_id = <cfqueryparam  value="#URL.user_id#">
</cfquery>

<!--- Update user form --->
<div class="form_wrapper">
	<cfform method="post" action="edit_user_action.cfm" >
		<cfinput name="user_id" type="hidden" value="#URL.user_id#">
		<p>
			<label class="form_label">First name</label>
			<cfinput name="first_name" value="#user_info.first_name#">
		</p>
		<p>
			<label class="form_label">Last name</label>
			<cfinput name="last_name" value="#user_info.last_name#">
		</p>
		<cfinput name="submit" type="submit" />
	</cfform>
</div>
</body>