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

<!--- Create a form for to register a new bug --->
<form name="register_bug" action="register_bug_action.cfm" method="post">
<!--- Status will be equal to N (New) always when register new bug --->
<!--<div class="form_elm">
		<label for="status">
			Status
		</label>
		<select id="status" name="status">
			<option value="N">New</option>
			<option value="O">Opened</option>
			<option value="S">Solved</option>
			<option value="C">Closed</option>
		</select>
	</div>
-->
	
	<p>
		<label class="form_label" for="sh_descr">
			Short decription
		</label>
		<input type="text" id="sh_descr" name="short_description" />
	</p>
	
	<p>
		<label class="form_label" for="urgency">
			Urgency
		</label>
		<select id="urgency" name="urgency">
			<option value="A">Very urgent</option>
			<option value="B">Urgent</option>
			<option value="C">Not very urgent</option>
			<option value="D">Not urgent</option>
		</select>
	</p>
	
	<p>
		<label class="form_label" for="criticality">
			Criticality
		</label>
		<select id="criticality" name="criticality">
			<option value="A">Accident</option>
			<option value="C">Critical</option>
			<option value="N">Not critical</option>
			<option value="Q">Query request</option>
		</select>
	</p>
	
	<p>
		<label class="form_label" for="full_descr">
			Full description
		</label>
		<textarea id="full_descr" name="full_description" ></textarea>
	</p>
	
	<p>
		<label class="form_label" for="comment">
			Comment
		</label>
		<input id="comment" name="comment" ></input>
	</p>
	
	<p>
		<input type="submit" id="full_descr" />
	</p>
</form>
</div>