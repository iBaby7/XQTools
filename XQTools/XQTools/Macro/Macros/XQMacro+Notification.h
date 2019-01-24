//
//  XQMacro+Notification.h
//  XQTools
//
//  Created by 杨名宇 on 2019/1/24.
//  Copyright © 2019 xq. All rights reserved.
//

#ifndef XQMacro_Notification_h
#define XQMacro_Notification_h

#define LISTEN(Edelegate,Eselector,EnotifyName,Eobject) [[NSNotificationCenter defaultCenter]addObserver:Edelegate selector:Eselector name:EnotifyName object:Eobject]
#define UNLISTEN(Edelegate,EnotifyName,Eobject) [[NSNotificationCenter defaultCenter]removeObserver:Edelegate name:EnotifyName object:Eobject]
#define TRIGGER(EnotifyName,Eobject) [[NSNotificationCenter defaultCenter]postNotificationName:EnotifyName object:Eobject]

#endif /* XQMacro_Notification_h */
