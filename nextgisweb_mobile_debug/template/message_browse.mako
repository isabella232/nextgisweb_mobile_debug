<%inherit file='nextgisweb:templates/base.mako' />

<table class="pure-table pure-table-horizontal" style="width: 100%;">
    <thead>
        <tr>
            <th style="width: 2em;">ID</th>
            <th style="width: 50%;">creation_dt</th>
            <th style="width: 50%">device_uuid</th>
            <th style="width: 50%">device_dt</th>
            <th style="width: 50%">server_url</th>
            <th style="width: 50%">login</th>
            <th style="width: 50%">message_type</th>

            <th style="width: 0px;">&nbsp;</th>
        </tr>
    </thead>
    <tbody>
        %for obj in obj_list:
            <tr>
                <td>${obj.id}</td>
                <td>${obj.creation_dt}</td>
                <td>${obj.device_uuid}</td>
                <td>${obj.device_dt}</td>
                <td>${obj.server_url}</td>
                <td>${obj.login}</td>
                <td>${obj.message_type}</td>
                <td>
                    <a class="dijitIconSearch" style="width: 16px; height: 16px; display: inline-block;" href="${request.route_url('mobile_debug.message.info', id=obj.id)}"></a>
                </td>
            </tr>
        %endfor
    </tbody>
</table>