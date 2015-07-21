<%inherit file='nextgisweb:templates/base.mako' />

<table class="pure-table pure-table-horizontal" style="width: 100%;">
    <thead>
        <tr>
            <th style="width: 4em;">ID</th>
            <th style="width: 20em;">Creation DT</th>
            <th style="width: 20em">Device UUID</th>
            <th style="width: 20em;">Device DT</th>
            <th style="width: 80em;">Server URL</th>
            <th style="width: 20em;">Login</th>
            <th style="width: 20em;">Message type</th>
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