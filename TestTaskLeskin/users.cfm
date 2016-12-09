<body class="main_wrapper">
<!--- Create new user form--->
	<cfinclude template="menu.cfm" >
	<cfform name="add_user" method="post" action="add_user_action.cfm">
		<p>
			<label class="form_label">Login</label>
			<cfinput name="login" required="true" >
		</p>
		<p>
			<label class="form_label">Password</label>
			<cfinput name="password" type="password" required="true" >
		</p>
		<p>
			<label class="form_label">Repeat password</label>
			<cfinput name="password2" type="password" required="true" >
		</p>
		<p>
			<label class="form_label">First name</label>
			<cfinput name="first_name" required="true" >
		</p>
		<p>
			<label class="form_label">Last name</label>
			<cfinput name="last_name" required="true" >
		</p>
			<cfinput name="submit" type="submit" >
	</cfform>
<!--- /Create new user --->	
	
<!--- Get list of users--->	
	<cfquery name="users_query" datasource="mydata">
		SELECT user_id, login, last_name, first_name
		FROM users
		 <cfif IsDefined("URL.sort")>
		 	ORDER BY #URL.sort# ASC
		 </cfif>
	</cfquery>
	<cfoutput >
<!--- Write user into table --->
	<div class="users_table_wrapper">
		<table id="users_table" class="list">
			<tr>
				<th width="2%">
					<a href="?sort=user_id">ID</a>
				</th>
				<th width="15%">
					<a href="?sort=login">Login</a>
				</th>
				<th width="35%">
					<a href="?sort=first_name">First name</a>
				</th>
				<th width="35%">
					<a href="?sort=last_name">Last name</a>
				</th>			
				<th width="13%">
					Edit
				</th>				
			</tr>
			<cfloop index="i" from="1" to="#users_query.RecordCount#">
				<tr>
					<td>
						#users_query.user_id[i]#
					</td>
					<td>
						#users_query.login[i]#
					</td>
					<td>
						#users_query.first_name[i]#
					</td>
					<td>
						#users_query.last_name[i]#
					</td>
					<td>
						<!--- Edit user--->
						<a href="/TestTaskLeskin/edit_user.cfm?user_id=#users_query.user_id[i]#">edit</a>
					</td>
				</tr>
			</cfloop>
		</table>
	</div>
	</cfoutput>
</body>