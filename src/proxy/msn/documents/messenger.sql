/*--------------------------------------------------------------------------------------------------*/
--title         : '����� �׷� ����'
--
--Description   : 
--
--Author        : 
--Date          : 
--NickName      : 
--Version       : 
/*--------------------------------------------------------------------------------------------------*/
If EXISTS (SELECT * FROM sysobjects WHERE name = 'TB_iEIP_MONITOR_GROUP') DROP TABLE TB_iEIP_MONITOR_GROUP
Go

CREATE TABLE TB_iEIP_MONITOR_GROUP
(
    mailadrs        nvarchar(64)        not null,                       -- �����ּ�
    groupid         nvarchar(64)        not null,                       -- �׷�Ƶ�
    
    grpname         nvarchar(64)            null,                       -- �׷��
    detect          datetime            not null default(getdate()),    -- �߰��Ͻ�
    
    sfid            datetime            not null default(getdate()),    -- create
    slmd            datetime            not null default(getdate())     -- update
)
Go

CREATE UNIQUE CLUSTERED INDEX IX_iEIP_MONITOR_GROUP ON TB_iEIP_MONITOR_GROUP
(
    mailadrs, groupid
)
Go

/*--------------------------------------------------------------------------------------------------*/
--title         : '����� ���� ����'
--
--Description   : 
--
--Author        : 
--Date          : 
--NickName      : 
--Version       : 
/*--------------------------------------------------------------------------------------------------*/
If EXISTS (SELECT * FROM sysobjects WHERE name = 'TB_iEIP_MONITOR_USRS') DROP TABLE TB_iEIP_MONITOR_USRS
Go

CREATE TABLE TB_iEIP_MONITOR_USRS
(
    mailadrs        nvarchar(64)        not null,                       -- �����ּ�
    
    userid          nvarchar(64)            null,                       -- ����ھƵ�
    name            nvarchar(32)            null,                       -- ����
    nick            nvarchar(128)           null,                       -- ����
    
    password        nvarchar(32)            null,                       -- ��ȣ

    company         nvarchar(64)            null,                       -- �Ҽ�ȸ��
    depart          nvarchar(64)            null,                       -- �ҼӺμ�
    empid           nvarchar(32)            null,                       -- ���
    empmail         nvarchar(64)            null,                       -- ȸ�����
    phone           nvarchar(32)            null,                       -- ��ȭ��ȣ

    gender          nvarchar(1)         not null default('M'),          -- ����
    ipadrs          nvarchar(32)            null,                       -- IP�ּ�

    detect          datetime            not null default(getdate()),    -- �߰��Ͻ�
    
    sfid            datetime            not null default(getdate()),    -- create
    slmd            datetime            not null default(getdate())     -- update
)
Go

CREATE UNIQUE CLUSTERED INDEX IX_iEIP_MONITOR_USRS ON TB_iEIP_MONITOR_USRS
(
    mailadrs
)
Go

/*--------------------------------------------------------------------------------------------------*/
--title         : '����� ģ�� ����'
--
--Description   : 
--
--Author        : 
--Date          : 
--NickName      : 
--Version       : 
/*--------------------------------------------------------------------------------------------------*/
If EXISTS (SELECT * FROM sysobjects WHERE name = 'TB_iEIP_MONITOR_BUDDY') DROP TABLE TB_iEIP_MONITOR_BUDDY
Go

CREATE TABLE TB_iEIP_MONITOR_BUDDY
(
    mailadrs        nvarchar(64)        not null,                       -- �����ּ�
    buddymail       nvarchar(64)        not null,                       -- ģ���ּ�
    
    buddyid         nvarchar(64)            null,                       -- ����ھƵ�
    buddynick       nvarchar(128)           null,                       -- ����

    groupid         nvarchar(64)            null,                       -- �׷�Ƶ�

    presence        decimal(4)              null,                       -- FL(1), AL(2), BL(4), RL(8)
    detect          datetime            not null default(getdate()),    -- �߰��Ͻ�
    
    sfid            datetime            not null default(getdate()),    -- create
    slmd            datetime            not null default(getdate())     -- update
)
Go

CREATE UNIQUE CLUSTERED INDEX IX_iEIP_MONITOR_BUDDY ON TB_iEIP_MONITOR_BUDDY
(
    mailadrs, buddymail
)
Go

/*--------------------------------------------------------------------------------------------------*/
--title         : '����͸� ���� ����'
--
--Description   : 
--
--Author        : 
--Date          : 
--NickName      : 
--Version       : 
/*--------------------------------------------------------------------------------------------------*/
If EXISTS (SELECT * FROM sysobjects WHERE name = 'TB_iEIP_MONITOR_MSGS') DROP TABLE TB_iEIP_MONITOR_MSGS
Go

CREATE TABLE TB_iEIP_MONITOR_MSGS
(
    seqno           decimal(38) IDENTITY(1,1) not null,                 -- �ڵ� ���� ��

    sender          nvarchar(64)            null,                       -- �۽��ڸ����ּ�
    sendipadrs      nvarchar(32)            null,                       -- �۽���IP�ּ�
    sendport        int                     null,                       -- �۽���Ʈ��ȣ
    sendernick      nvarchar(128)           null,                       -- �۽��ں���
    
    receiver        nvarchar(64)            null,                       -- �����ڸ����ּ�
    recvipadrs      nvarchar(32)            null,                       -- ������IP�ּ�
    recvport        int                     null,                       -- ��Ʈ��ȣ

    sentime         datetime            not null default(getdate()),    -- �۽� �Ͻ�
    content         nvarchar(4000)          null,                       -- ����
    
    attach          image                   null,                       -- ��������

    sfid            datetime            not null default(getdate()),    -- create
    slmd            datetime            not null default(getdate())     -- update
)
Go

CREATE UNIQUE CLUSTERED INDEX IX_iEIP_MONITOR_MSGS ON TB_iEIP_MONITOR_MSGS
(
    seqno
)
Go

/*--------------------------------------------------------------------------------------------------*/
--
/*--------------------------------------------------------------------------------------------------*/