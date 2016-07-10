/*--------------------------------------------------------------------------------------------------*/
--title         : '���� ���� �ּ� ����'
--
--Description   : 
--
--Author        : 
--Date          : 
--NickName      : 
--Version       : 
/*--------------------------------------------------------------------------------------------------*/
If EXISTS (SELECT * FROM sysobjects WHERE name = 'TB_iEIP_MONITOR_SMTP_SPAM') DROP TABLE TB_iEIP_MONITOR_SMTP_SPAM
Go

CREATE TABLE TB_iEIP_MONITOR_SMTP_SPAM
(
    sender          nvarchar(64)        not null,                       -- �۽��ڸ����ּ�
	
    sendipadrs      nvarchar(32)            null,                       -- �۽���IP�ּ�

	typeofsender	nvarchar(1)			not null default('M'),			-- �ּ�����(M:mail, D:domain)
	inclusion		nvarchar(1)			not null default('S'),			-- �����ּ�('S'), ��ȿ�� �ּ�('V')

    sfid            datetime            not null default(getdate()),    -- create
    slmd            datetime            not null default(getdate())     -- update
)
Go

CREATE UNIQUE CLUSTERED INDEX IX_iEIP_MONITOR_SMTP_SPAM ON TB_iEIP_MONITOR_SMTP_SPAM
(
    sender
)
Go

/*--------------------------------------------------------------------------------------------------*/
--
/*--------------------------------------------------------------------------------------------------*/