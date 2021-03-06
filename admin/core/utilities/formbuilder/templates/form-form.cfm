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
<cfoutput><span>
		<div class="mura-tb-form" id="formblock-${fieldid}">
			<div class="mura-tb-header">
				<h2><span id="mura-tb-form-label">#mmRBF.getKeyValue(session.rb,'formbuilder.form')#</span></h2>
			</div>
			<ul class="template-form">
				<li>
					<label for="label">#mmRBF.getKeyValue(session.rb,'formbuilder.form.emailsubject')#</label>
					<input class="text tb-emailsubject" type="text" name="emailsubject" value="" data-label="true">
				</li>
				<li>
					<label for="name">#mmRBF.getKeyValue(session.rb,'formbuilder.form.replyto')#</label>
					<input class="text tb-replyto" type="text" name="replyto" value="" data-label="true">
				</li>
				<li>
					<label for="name">#mmRBF.getKeyValue(session.rb,'formbuilder.form.submitlabel')#</label>
					<input class="text tb-submitlabel" type="text" name="submitlabel" value="" data-label="true">
				</li>
				<li>
					<label for="name">#mmRBF.getKeyValue(session.rb,'formbuilder.form.class')#</label>
					<input class="text tb-class" type="text" name="class" value="" data-label="true">
				</li>
				<li>
					<label for="name-restricted">#mmRBF.getKeyValue(session.rb,'formbuilder.form.nameunrestricted')#</label>
					<input id="tb-name-restricted" class="text tb-class" type="checkbox" name="name-unrestricted" value="1" data-label="true"> *
				</li>
				<!---
				<li>
					<label for="muraormentities">#mmRBF.getKeyValue(session.rb,'formbuilder.form.muraormentities')#</label>
					<input id="tb-muraormentities" class="text tb-class" type="checkbox" name="muraormentities" value="1" data-label="true"> **
				</li>--->
				<input id="tb-muraormentities" class="text tb-class" type="hidden" name="muraormentities" value="0" data-label="true">

				<li>
					<div>
					*#mmRBF.getKeyValue(session.rb,'formbuilder.form.nameunrestrictedtip')#
					</div>
					<!---<div>
					**#mmRBF.getKeyValue(session.rb,'formbuilder.form.muraormentitiestip')#
				</div>--->
				</li>



			</ul>
		</div>
	</span>
</cfoutput>
