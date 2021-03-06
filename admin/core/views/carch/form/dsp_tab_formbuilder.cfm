 <!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without
Mura CMS under the license of your choice, provided that you follow these specific guidelines:

Your custom code

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

 /admin/
 /tasks/
 /config/
 /core/mura/
 /Application.cfc
 /index.cfm
 /MuraProxy.cfc

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->
<cfinclude template="head_formbuilder.cfm">

<cfset tabLabelList=listAppend(tabLabelList,application.rbFactory.getKeyValue(session.rb,"sitemanager.content.tabs.basic"))/>
<cfset tabList=listAppend(tabList,"tabBasic")>
<cfoutput>
<div id="tabBasic" class="tab-pane active">

		<!-- block -->
	  <div class="block block-bordered">
	  	<!-- block header -->
	    <div class="block-header">
					<h3 class="block-title">Form Builder</h3>
	    </div>
	    <!-- /block header -->

			<!-- block content -->
			<div class="block-content">

		<span id="extendset-container-tabbasictop" class="extendset-container"></span>

	<input type="hidden" id="menuTitle" name="menuTitle" value="">
			<div class="mura-control-group">
				<label>
			#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.title')#
		</label>
			<input type="text" id="title" name="title" value="#esapiEncode('html_attr',rc.contentBean.getTitle())#"  maxlength="255" required="true" message="#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.titlerequired')#">
		</div>

		<cfif rc.type neq 'Form' and  rc.type neq 'Component' >
			<div class="mura-control-group">
				<label>
			<a href="##" rel="tooltip" title="#esapiEncode('html_attr',application.rbFactory.getKeyValue(session.rb,"tooltip.contentSummary"))#">
				#application.rbFactory.getKeyValue(session.rb,"sitemanager.content.fields.summary")#
					 <i class="mi-question-circle"></i></a>
			<a href="##" id="editSummaryLink" onclick="javascript: toggleDisplay('editSummary','#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.expand')#','#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.close')#'); editSummary();return false">
				[#application.rbFactory.getKeyValue(session.rb,"sitemanager.content.fields.expand")#]
			</a>
		</label>
				<div class="mura-control justify" id="editSummary" style="display:none;">
			<cfoutput><textarea name="summary" id="summary" cols="96" rows="10"><cfif application.configBean.getValue("htmlEditorType") neq "none" or len(rc.contentBean.getSummary())>#esapiEncode('html',rc.contentBean.getSummary())#<cfelse><p></p></cfif></textarea></cfoutput>
		</div>
	</div>
		</cfif>

			<div class="mura-control-group">
				<label>
			#application.rbFactory.getKeyValue(session.rb,"sitemanager.content.fields.content")#
		</label>
				<div id="bodyContainer" class="mura-control justify">
			<cfinclude template="dsp_formbuilder.cfm">
		</div>
	</div>

		<span id="extendSetsBasic"></span>

		<cfif rc.type eq 'Form'>
			<!---
			<div class="mura-control-group">
				<label>#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.formpresentation')#</label>
				<div class="mura-control justify">
					<label for="rc" class="checkbox inline">
								<input name="responseChart" id="rc" type="checkbox" value="1" <cfif rc.contentBean.getresponseChart() eq 1>checked </cfif> class="checkbox">
						#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.ispoll')#
					</label>
				</div>
			</div>
			--->
			<div class="mura-control-group">
				<label>
			#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.confirmationmessage')#
		</label>
			<textarea name="responseMessage" rows="6">#esapiEncode('html',rc.contentBean.getresponseMessage())#</textarea>
		</div>
			<div class="mura-control-group">
				<label>#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.fields.responsesendto')#
		</label>
			<input type="text" name="responseSendTo" value="#esapiEncode('html_attr',rc.contentBean.getresponseSendTo())#">
		</div>
		</cfif>

		<span id="extendset-container-basic" class="extendset-container"></span>
		<span id="extendset-container-tabbasicbottom" class="extendset-container"></span>

		</div> <!--- /.block-content --->
	</div> <!--- /.block --->
</div> <!--- /.tab-pane ---></cfoutput>
