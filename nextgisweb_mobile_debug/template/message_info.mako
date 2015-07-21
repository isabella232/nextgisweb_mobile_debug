<%inherit file='nextgisweb:templates/base.mako' />

<table width="100%" class="tableContainer-table tableContainer-table-horiz" cellspacing="1">
    <tr>
        <td class="tableContainer-labelCell" style="width: 150px;">
            <label>ID</label>
        </td>
        <td class="tableContainer-valueCell">
            <div class="dijit dijitReset dijitInline dijitLeft dijitTextBox dijitValidationTextBox">${obj.id}</div>
        </td>
    </tr>
    <tr>
        <td class="tableContainer-labelCell" style="width: 150px;">
            <label>Creation DT</label>
        </td>
        <td class="tableContainer-valueCell">
            <div class="dijit dijitReset dijitInline dijitLeft dijitTextBox dijitValidationTextBox">${obj.creation_dt}</div>
        </td>
    </tr>
        <tr>
        <td class="tableContainer-labelCell" style="width: 150px;">
            <label>Device UUID</label>
        </td>
        <td class="tableContainer-valueCell">
            <div class="dijit dijitReset dijitInline dijitLeft dijitTextBox dijitValidationTextBox">${obj.device_uuid}</div>
        </td>
    </tr>
    </tr>
        <tr>
        <td class="tableContainer-labelCell" style="width: 150px;">
            <label>Device DT</label>
        </td>
        <td class="tableContainer-valueCell">
            <div class="dijit dijitReset dijitInline dijitLeft dijitTextBox dijitValidationTextBox">${obj.device_dt}</div>
        </td>
    </tr>
    </tr>
    <tr>
        <td class="tableContainer-labelCell" style="width: 150px;">
            <label>Server URL</label>
        </td>
        <td class="tableContainer-valueCell">
            <div class="dijit dijitReset dijitInline dijitLeft dijitTextBox dijitValidationTextBox">${obj.server_url}</div>
        </td>
    </tr>
    <tr>
        <td class="tableContainer-labelCell" style="width: 150px;">
            <label>Login</label>
        </td>
        <td class="tableContainer-valueCell">
            <div class="dijit dijitReset dijitInline dijitLeft dijitTextBox dijitValidationTextBox">${obj.login}</div>
        </td>
    </tr>
     <tr>
        <td class="tableContainer-labelCell" style="width: 150px;">
            <label>Log cat</label>
        </td>
        <td class="tableContainer-valueCell">
            <textarea dojoType="dijit.form.TextArea">${obj.logcat}</textarea>
        </td>
    </tr>
</table>