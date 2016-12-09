<body class="main_wrapper">
<cfinclude template="menu.cfm" >	
<!--- Checking if user is logged in --->
<cfif not IsDefined("Session.user_id")>
	<cfoutput >
		<a href="login.cfm">
			Authorize first
		</a>
		<cfexit />
	</cfoutput>
<cfelseif #Session.user_id# LTE 0>
	<cfoutput >
		<a href="login.cfm">
			Authorize first
		</a>
		<cfexit />
	</cfoutput>	
</cfif>
<!--- /Checking if user is logged in --->

<!--- Get bugs list sorted by chosen column --->
<cfquery name="bugs_query" datasource="mydata">
	SELECT a.bug_id, a.create_date, a.short_description, a.full_description, a.user_id, a.status,
	 a.urgency, a.criticality, b.first_name, b.last_name
	FROM bugs as a LEFT JOIN users as b ON a.user_id = b.user_id
	 <cfif IsDefined("URL.sort")>
	 	ORDER BY #URL.sort# ASC
	 </cfif>
</cfquery>

<!--- Write bugs into table --->
<cfoutput >
	<table id="bugs_table" class="list">
		<tr>
			<th width="2%">
				<a href="?sort=bug_id">ID</a>
			</th>
			<th width="15%">
				<a href="?sort=create_date">Register Date</a>
			</th>
			<th width="15%">
				<a href="?sort=short_description">Short description</a>
			</th>
			<th width="15%">
				<a href="?sort=full_description">Full description</a>
			</th>
			<th width="15%">
				<a href="?sort=status">Status</a>
			</th>
			<th width="15%">
				<a href="?sort=urgency">Urgency</a>
			</th>
			<th width="15%">
				<a href="?sort=criticality">Criticality</a>
			</th>
			<th width="15%">
				<a href="?sort=first_name">User</a>
			</th>			
			<th>
				Edit
			</th>				
		</tr>
		<cfloop index="i" from="1" to="#bugs_query.RecordCount#">
			<tr>
				<td>
					#bugs_query.bug_id[i]#
				</td>
				<td>
					#bugs_query.create_date[i]#
				</td>
				<td>
					#bugs_query.short_description[i]#
				</td>
				<td>
					#bugs_query.full_description[i]#
				</td>
				<td>
					#bugs_query.status[i]#
				</td>
				<td>
					#bugs_query.urgency[i]#
				</td>
				<td>
					#bugs_query.criticality[i]#
				</td>
				<td>
					#bugs_query.first_name[i]# #bugs_query.last_name[i]#
				</td>
				<td>
					<a href="/TestTaskLeskin/edit_bug.cfm?bug_id=#bugs_query.bug_id[i]#">edit</a>
				</td>
			</tr>
		</cfloop>
	</table>
</cfoutput>
</body>