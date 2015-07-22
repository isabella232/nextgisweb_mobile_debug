# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from datetime import datetime
from nextgisweb.file_storage import FileObj

from nextgisweb.models import declarative_base
from nextgisweb import db
from sqlalchemy.sql import func

Base = declarative_base()


class MobileMessage(Base):
    __tablename__ = 'mobile_debug_messages'

    id = db.Column(db.Integer, primary_key=True)
    creation_dt = db.Column(db.DateTime, default=func.now())
    message_type = db.Column(db.Text)
    device_uuid = db.Column(db.Text)
    device_dt = db.Column(db.DateTime)
    server_url = db.Column(db.Text)
    login = db.Column(db.Text)
    logcat = db.Column(db.Text)

    fileobj_id = db.Column(db.ForeignKey(FileObj.id), nullable=True)
    fileobj = db.relationship(FileObj)


