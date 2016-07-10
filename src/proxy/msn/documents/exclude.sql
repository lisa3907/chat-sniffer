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
If EXISTS (SELECT * FROM sysobjects WHERE name = 'TB_iEIP_MONITOR_MSGS_SPAM') DROP TABLE TB_iEIP_MONITOR_MSGS_SPAM
Go

CREATE TABLE TB_iEIP_MONITOR_MSGS_SPAM
(
    sender          nvarchar(64)        not null,                       -- �۽��ڸ����ּ�
	inclusion		nvarchar(1)			not null default('S'),			-- �����ּ�('S'), ��ȿ�� �ּ�('V')

    sfid            datetime            not null default(getdate()),    -- create
    slmd            datetime            not null default(getdate())     -- update
)
Go

CREATE UNIQUE CLUSTERED INDEX IX_iEIP_MONITOR_MSGS_SPAM ON TB_iEIP_MONITOR_MSGS_SPAM
(
    sender
)
Go

/*--------------------------------------------------------------------------------------------------*/
--
/*--------------------------------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------------------------------
INSERT INTO TB_iEIP_MONITOR_MSGS_SPAM (sender, inclusion) VALUES ( 'lisa3907@msn.com', 'S')
--------------------------------------------------------------------------------------------------*/
