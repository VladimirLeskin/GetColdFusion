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

<!--- Get this bug history --->
<cfquery name="bug_history_query" datasource="mydata">
	SELECT a.date, a.action, a.comment, a.action_id, b.first_name, b.last_name
	FROM bugs_history as a LEFT JOIN users as b ON a.user_id = b.user_id
	WHERE bug_id = <cfqueryparam value="#URL.bug_id#">	
</cfquery>

<!--- Get bug attributes (columns) --->
<cfquery name="bug_info" datasource="mydata">
	SELECT short_description, full_description, status, urgency, criticality
	FROM bugs WHERE bug_id = <cfqueryparam  value="#URL.bug_id#">
</cfquery>

<!--- Update bug form --->
<div class="form_wrapper">
	<cfform method="post" action="edit_bug_action.cfm" >
		<cfinput name="bug_id" type="hidden" value="#URL.bug_id#">
		<p>
			<label class="form_label">Short description</label>
			<cfinput name="short_description" value="#bug_info.short_description#">
		</p>
		<p>
			<label class="form_label">Full description</label>
			<cftextarea name="full_description" value="#bug_info.full_description#">
				
			</cftextarea>
		</p>
		<p>
			<label class="form_label">Comment</label>
			<cfinput name="comment" required="true">
		</p>
		<p>
			<label class="form_label">Status</label>
			
<!--- Realization of finite-state automaton of bug statuses--->
			<cfselect name="status" >
				<cfif #bug_info.status# EQ 'N'>
					<option value="N" selected="selected">New</option>
					<option value="O" >Opened</option>
				<cfelseif #bug_info.status# EQ 'O'>
					<option value="O" selected="selected">Opened</option>
					<option value="S" >Solved</option>
				<cfelseif #bug_info.status# EQ 'S' >
					<option value="O" >Opened</option>
					<option value="S" selected="selected">Solved</option>
					<option value="C" >Closed</option>
				<cfelseif #bug_info.status# EQ 'C' >
					<option value="C" selected="selected">Closed</option>
				</cfif>
			</cfselect>
<!--- /Realization of finite-state automaton of bug statuses--->
		</p>
		<p>
			<label class="form_label">Urgency</label>
			<cfselect name="urgency" >
				<option value="A" <cfif #bug_info.urgency# EQ 'A'>selected="selected"</cfif>>Very urgent</option>
				<option value="B" <cfif #bug_info.urgency# EQ 'B'>selected="selected"</cfif>>Urgent</option>
				<option value="C" <cfif #bug_info.urgency# EQ 'C'>selected="selected"</cfif>>Not very urgent</option>
				<option value="D" <cfif #bug_info.urgency# EQ 'D'>selected="selected"</cfif>>Not urgent</option>
			</cfselect>
		</p>
		<p>
			<label class="form_label">Criticality</label>
			<cfselect name="criticality" >
				<option value="A" <cfif #bug_info.criticality# EQ 'A'>selected="selected"</cfif>>Accident</option>
				<option value="C" <cfif #bug_info.criticality# EQ 'C'>selected="selected"</cfif>>Critical</option>
				<option value="N" <cfif #bug_info.criticality# EQ 'N'>selected="selected"</cfif>>Not critical</option>
				<option value="Q" <cfif #bug_info.criticality# EQ 'Q'>selected="selected"</cfif>>Query request</option>
			</cfselect>
		</p>
		<cfinput name="submit" type="submit" />
	</cfform>
</div>
<!--- /Update bug form --->

<!--- Write bug history into table --->
<cfoutput >
	<div class="table_div">
	<table width>
		<tr>
			<th width="5%">
				N
			</th>
			<th width="20%">
				Date
			</th>
			<th width="5%">
				Action
			</th>
			<th width="50%">
				Comment
			</th>
			<th width="20%">
				User
			</th>
		</tr>
		<cfloop index="i" from="1" to="#bug_history_query.RecordCount#">
			<tr>
				<td>
					#i#
				</td>
				<td>
					#bug_history_query.date[i]#
				</td>
				<td>
					#bug_history_query.action[i]#
				</td>
				<td>
					#bug_history_query.comment[i]#
				</td>
				<td>
					#bug_history_query.first_name[i]# #bug_history_query.last_name[i]#
				</td>
			</tr>
		</cfloop>
	</table>
	</div>
</cfoutput>
<!--- /Write bug history into table --->
</body>