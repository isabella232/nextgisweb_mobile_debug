# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from datetime import datetime
import json
import pprint
from pyramid.httpexceptions import HTTPForbidden, HTTPMethodNotAllowed, HTTPBadRequest
from pyramid.response import Response
from pyramid.view import view_config
from sqlalchemy import desc

from .model import MobileMessage
from nextgisweb import dynmenu as dm


def check_permission(request):
    if not request.user.is_administrator:
        raise HTTPForbidden("Membership in group 'administrators' required!")


@view_config(renderer='json')
def append_message(request):
    if request.user.keyname == 'guest':
        raise HTTPForbidden()

    if request.method != 'POST':
        raise HTTPMethodNotAllowed()

    params = request.json_body

    if not params \
            or 'device_uuid' not in params.keys() \
            or 'date' not in params.keys() \
            or 'server_url' not in params.keys()\
            or 'login' not in params.keys()\
            or 'logcat' not in params.keys()\
            or 'message_type' not in params.keys():
        raise HTTPBadRequest()

    mmessage = MobileMessage()
    mmessage.device_uuid = params['device_uuid']
    mmessage.device_dt = datetime.utcfromtimestamp(params['date'])
    mmessage.server_url = params['server_url']
    mmessage.login = params['login']
    mmessage.message_type = params['message_type']

    try:
        mmessage.logcat = json.dumps(params['logcat'], indent=4)
    except:
        mmessage.logcat = str(params['logcat'])


    mmessage.persist()

    return Response('')


def messages_browse(request):
    check_permission(request)
    return dict(
        title=u"Сообщения с мобильных устройств",
        obj_list=MobileMessage.query().order_by(desc(MobileMessage.id)),
        dynmenu=request.env.pyramid.control_panel)


def message_info(request):
    check_permission(request)
    return dict(
        title=u"Сообщение %s с мобильного устройства" % request.matchdict['id'],
        obj=MobileMessage.filter_by(id=request.matchdict['id']).one(),
        dynmenu=request.env.pyramid.control_panel)


def setup_pyramid(comp, config):

    config.add_route(
        'mobile_debug.message.browse',
        '/mobile_debug/messages/') \
        .add_view(messages_browse, renderer='nextgisweb_mobile_debug:/template/message_browse.mako')

    config.add_route(
        'mobile_debug.message.info',
        '/mobile_debug/message/{id:\d+}', client=('id', )) \
        .add_view(message_info, renderer='nextgisweb_mobile_debug:/template/message_info.mako')

    config.add_route(
        'mobile_debug.message.append',
        '/mobile_debug/message/append').add_view(append_message)


    class MobileDebugMenu(dm.DynItem):

        def build(self, kwargs):
            yield dm.Link(
                self.sub('browse'), u"Список",
                lambda kwargs: kwargs.request.route_url('mobile_debug.message.browse')
            )

    MobileDebugMenu.__dynmenu__ = comp.env.pyramid.control_panel

    comp.env.pyramid.control_panel.add(
        dm.Label('mobile-debug', u"Сообщения с мобильных устройств"),
        MobileDebugMenu('mobile-debug'),
    )

