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
<cfsilent>
	<cfset content=rc.$.getBean('content').loadBy(contenthistid=rc.contenthistid)>
	<cfparam name="rc.relatedcontentsetid" default="">
	<cfparam name="rc.relateditems" default="[]">
</cfsilent>
<cfinclude template="js.cfm">
<cfoutput>

<div class="mura-header">
	<cfif rc.relatedcontentsetid eq 'calendar'>
		<h1>Select Additional Calendars</h1>
	<cfelse>
		<h1>Select Content</h1>
	</cfif>
	<!---
			<div class="nav-module-specific btn-toolbar">
				<div class="btn-group">
					<a class="btn" href="javascript:frontEndProxy.post({cmd:'close'});"><i class="mi-arrow-circle-left"></i>  #application.rbFactory.getKeyValue(session.rb,'collections.back')#</a>
				</div>
			</div> <!-- /.nav-module-specific -->
	--->
</div> <!-- /.mura-header -->

<div class="block block-constrain">
	<div class="block block-bordered">
		<div class="block-content">
			<div id="selectRelatedContent"><!--- target for ajax ---></div>
			<div id="selectedRelatedContent" class="control-group">
			</div>
			<input id="relatedContentSetData" type="hidden" name="relatedContentSetData" value="" />
			<div class="mura-actions">
				<div class="form-actions">
					<button class="btn mura-primary" id="updateBtn"><i class="mi-check-circle"></i>Update</button>
				</div>
			</div>
		</div> <!-- /.block-content -->
	</div> <!-- /.block-bordered -->
</div> <!-- /.block-constrain -->

<script>
$(function(){

	function getItems(){
		var raw=$('##relatedContentSetData').val();
		if(raw){
			var parsed=JSON.parse(raw);
			return parsed[0].items;
		} else {
			return [];
		}
	}

	$('##updateBtn').click(function(){
		//alert(JSON.stringify(getItems()))
		//return;
		frontEndProxy.post({
			cmd:'setObjectParams',
			reinit:true,
			instanceid:'#esapiEncode("javascript",rc.instanceid)#',
			params:{
				source:'#esapiEncode("javascript",rc.relatedcontentsetid)#',
				sourcetype:'relatedcontent',
				items: JSON.stringify(getItems())
				}
			});
	});

	if($("##ProxyIFrame").length){
		$("##ProxyIFrame").load(
			function(){
				frontEndProxy.post({cmd:'setWidth',width:'standard'});
			}
		);
	} else {
		frontEndProxy.post({cmd:'setWidth',width:'standard'});
	}


	siteManager.loadRelatedContentSets(
		'#esapiEncode("javascript",content.getContentID())#',
		'#esapiEncode("javascript",content.getContentHistID())#',
		'#esapiEncode("javascript",content.getType())#',
		'#esapiEncode("javascript",content.getSubType())#',
		'#esapiEncode("javascript",content.getSiteID())#',
		'#esapiEncode("javascript",rc.relatedcontentsetid)#',
		'#esapiEncode("javascript",rc.items)#',
		false
	);

});
</script>
</cfoutput>
