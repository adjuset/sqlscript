
INSERT INTO TBL_BUY(custom_id, pcode, QUANTITY,BUYNO)
VALUES('sana97','GALAXYS22',1,tblbuy_seq.nextval);

SELECT * FROM TBL_BUY tb ;

----commit�� rollback�׽�Ʈ ---------------------------------------------------
--ȸ���� ���ų��� ����
DELETE FROM TBL_BUY tb WHERE CUSTOM_ID ='twice';
DELETE FROM TBL_CUSTOM tc  WHERE CUSTOM_ID  ='sana97';

SELECT * FROM TBL_CUSTOM tc ;
SELECT * FROM TBL_BUY tb ;
COMMIT;
ROLLBACK;


------------------
SELECT * FROM tbl_custom;

SELECT * FROM TBL_CUSTOM tc WHERE CUSTOM_ID ='twice';