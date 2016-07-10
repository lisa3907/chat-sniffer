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
If EXISTS (SELECT * FROM sysobjects WHERE name = 'TB_iEIP_MONITOR_SMTP') DROP TABLE TB_iEIP_MONITOR_SMTP
Go

CREATE TABLE TB_iEIP_MONITOR_SMTP
(
    seqno           decimal(38) IDENTITY(1,1) not null,                 -- �ڵ� ���� ��

    sender          nvarchar(64)            null,                       -- �۽��ڸ����ּ�
    sendipadrs      nvarchar(32)            null,                       -- �۽���IP�ּ�
    sendport		nvarchar(8)             null,                       -- �۽���Port#

    receivers       nvarchar(1024)          null,                       -- �����ڸ����ּ�
    recvipadrs      nvarchar(32)            null,                       -- ������IP�ּ�

    title			nvarchar(1024)          null,                       -- ����

    sentime         datetime            not null default(getdate()),    -- �۽� �Ͻ�
    attach			decimal(5)			not null default(0),			-- ÷�ΰ���
    content         image					null,                       -- ����
    
    timeout			nvarchar(1)             null,                       -- Is timeout?
    validation		nvarchar(1)             null,                       -- Is correct?
    completed		nvarchar(1)             null,                       -- Is Completed?

    protocol        nvarchar(64)            null,                       -- ESMTP/SMTP
    command         nvarchar(64)            null,                       -- ������ ���� ���
    response        nvarchar(64)            null,                       -- ������ ���� ����

    sfid            datetime            not null default(getdate()),    -- create
    slmd            datetime            not null default(getdate())     -- update
)
Go

CREATE UNIQUE CLUSTERED INDEX IX_iEIP_MONITOR_SMTP ON TB_iEIP_MONITOR_SMTP
(
    seqno
)
Go

/*--------------------------------------------------------------------------------------------------*/
--
/*--------------------------------------------------------------------------------------------------*/