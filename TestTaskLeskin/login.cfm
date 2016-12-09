<body class="main_wrapper">
	<cfinclude template="menu.cfm" >
	<!--- If already logged in, do not show form --->
	<cfif #Session.user_id# GT 0>
		You've already been logged in
		<br/><a href="/TestTaskLeskin/logout.cfm">Logout</a>
		<cfexit />
	</cfif>	
	
	<!--- Simple login form --->
	<cfform name="login_form" action="login_action.cfm" method="post" >	
		<p>	
			<label class="form_label">Login</label>
			<cfinput type="text" name="login" required="true" />
		</p>
		
		<p>
			<label class="form_label">Password</label>
			<input type="password" name="password" required="true"/>
		</p>
		<cfinput type="submit" name="submit"/>
	</cfform>
</body>