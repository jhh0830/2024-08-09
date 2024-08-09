
/*
    < �Լ� FUNCTION>
    
    �ϳ��� ��� ����, �ڹٷ� ������ �޼ҵ�� ���� ����
    ���޵� ������ �о ó���� (�����) ����� ��ȯ
    
    - ������ �Լ� : N ���� ���� �о N���� ����� ����
                  ��, �� �ึ�� �Լ� ���� �� �� ���� ����� ��� ����
    - �׷� �Լ� (���� �Լ�) : N ���� ���� �о 1 ���� ����� ����
                           ��, �� ���� �ϳ��� �׷캰�� ��� 
                           ���� �� ����� ����
    
    
    > ������ �Լ��� �׷� �Լ��� �Բ� ����� �� ����!!
      ��? ��� (RESULT SET) ���� ������ �ٸ��� ����
      (�׻� �����ͺ��̽��� ���̺�, RESULT SET �� ����
      �����͸� ��Ÿ���� ǥ ������ �ݵ�ݵ� �׸� ����̿��� ��!!)
      
*/

------------------------------------------------------------------

-----< ������ �Լ� >----------
/*
    < ���ڿ��� ���õ� �Լ� >
    
    LENGTH / LENGTHB
    
    - LENGTH(STR) : �ش� ���޵� ���ڿ��� ���� �� ��ȯ
    - LENGTHB (STR) : �ش� ���޵� ���ڿ��� ����Ʈ �� ��ȯ
    
    STR : '���ڿ�' / ���ڿ� Ÿ�� �÷���
    ������� NUMBER Ÿ������ ��ȯ
    
    ����, ����, Ư������ : '!', '~', 'A', 'a', '1' ��
                        �� ���ڴ� 1BYTE �� ���
    �ѱ� : '��', '��', '��', '��' ��
          �� ���ڴ� 3BYTE �� ���
          
    
*/

SELECT LENGTH ('����Ŭ!'), LENGTHB('����Ŭ!')
FROM DUAL;

-- DUAL : �������̺�, DUMMY TABLE
--        ���ͷ��� ������ �ܼ� ����� �Ǵ� �Լ����� ó���� �����
--        �ٷ� ����غ��� ���� �� FROM���� ����ϴ� ������ ���̺��
SELECT 1+4
FROM DUAL;
-- EMPLOYEE ���̺��� �÷��� ����
SELECT EMAIL
        , LENGTH(EMAIL)
        , LENGTHB(EMAIL)
        , EMP_NAME
        , LENGTH (EMP_NAME)
        , LENGTHB (EMP_NAME)
    FROM EMPLOYEE;
    
------------------------------------------------

/*
    INSTR
    
    -INSTR(STR) : ���޵� ���ڿ��κ��� Ư�� ������ ��ġ�� ��ȯ
    
    INSTR(STR, 'Ư������', ã����ġ�ǽ��۰�, ����) 
    
    STR : '���ڿ�' / ���ڿ� Ÿ�� �÷���
    ������� NUMBER Ÿ������ ��ȯ
    
    ã����ġ�ǽ��۰�
    1 : �տ������� ã�ڴ�. (���� �� �⺻��)
    -1 : �ڿ������� ã�ڴ�.
    
    
    
*/
    
SELECT INSTR('AABAACAABBAA', 'B')
    FROM DUAL; -- ����� : 3
--> ã����ġ , ���� ���� �� �⺻������ "�տ��� ���� ù��°" ������ ��ġ �˻� 
-- (3��° ���ڶ� ������� 3 �ڹٶ� �ٸ��� ����� 1���� ��)  

SELECT INSTR('AABAACAABBAA','B',1)
FROM DUAL;
--> ã����ġ�ǽ��۰��� 1�� �����صθ� "�տ�������" ã����

SELECT INSTR('AABBAACAABBAA','B',-1)
FROM DUAL; -- ����� 10
--> ã����ġ�� ���۰��� -1�� �����صθ� "�ڿ�������" ã����

SELECT INSTR('AABAACAABBAA', 'B',1,2)
FROM DUAL; -- 9
--> ������ 2�� �����صθ� "�ι�° ����" �� ��ġ�� ã����


SELECT INSTR('AABAACAABBAA', 'B', -1, 2)
FROM DUAL; -- 9
--> �ڿ������� (-1) �ι�°�� ��ġ�ϴ� (2) B �� ��ġ����
--  �տ������� ���� �˷��� ��!!


-- EMPLOYEE ���̺� ����
-- EMAIL �÷����κ��� @ �� ��ġ�� �˾Ƴ���
SELECT INSTR(EMAIL, '@'/*,1,1*/) AS "@�� ��ġ"
FROM EMPLOYEE;

------------------------------------------------

/*
    SUBSTR


    - SUBSTR(STR, POSITION, LENGTH)
    : ���޵� ���ڿ��κ��� Ư�� ���ڿ��� �����ؼ� ��ȯ
    (�ڹٷ� ġ�� .substring() �޼ҵ�� ����)
    
    
    - STR : '���ڿ�'/ ���ڿ� Ÿ�� �÷���
    - POSTION : ���ڿ��� ������ ������ġ��
                POISTION ��° ���ں��� ����
    - LENGTH : ������ ���� ���� (���� ����)
                ���� �� ������ �����ϰڴ�. ��� �ǹ�
    �������  CHARACTER (���ڿ�) Ÿ���� ��ȯ
*/

SELECT SUBSTR('SHOWMETHEMONEY', 7)
FROM DUAL; -- THEMONEY
--> 7���� ���ں��� ������ �����ϰڴ�. (LENGTH ����)

SELECT SUBSTR('SHOWMETHEMONEY', 5, 2)
FROM DUAL; -- ME
--> 5��° ���ں��� 2���� �����ϰڴ�.

SELECT SUBSTR('SHOWMETHEMONEY' ,1,6)
FROM DUAL; -- SHOWME

SELECT SUBSTR('SHOWMETHEMONEY',-8,3)
FROM DUAL; -- THE
--> �ڿ������� 8��° ���ڷκ��� 3���� �����ϰڴ�.
--  POSITION ���� �����ε� ���� ����
--  : �ڿ������� N ��° ��ġ�κ��� �����ϰڴ�. ��� ��

-- EMPLOYEE ���̺��� ����
-- �ֹε�Ϲ�ȣ���� ���� �κи� �����ؼ� ����(1) / ����(2) üũ
SELECT EMP_NAME
    , EMP_NO
    , SUBSTR(EMP_NO, 8,1) "����"
FROM EMPLOYEE;


-- ���ڻ���鸸 ��ȸ (�����, �޿�)
-- WHERE EMP_NO = 1;
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
-- WHERE SUBSTR(EMP_NO, 8,1) ='1'
--    OR SUBSTR(EMP_NO,8,1) = '3';
WHERE SUBSTR(EMP_NO, 8 ,1) IN ('1','3');

-- ���ڻ���鸸 ��ȸ (�����, �޿�)
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8 ,1) IN ('2','4');

-- �̸��Ͽ��� ID �κи� �����ؼ� ��ȸ
SELECT EMP_NAME
    , EMAIL
    , SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') -1) "ID"
    FROM EMPLOYEE;

-- > �Լ� ȣ�� �����ȿ� �Լ� ȣ�� ������ ��ø�ؼ� ��� ����
----------------------------------------------------------

/*
    LPAD / RPAD
    - LPAD/ RPAD(STR, 
    �������� ��ȯ�ҹ����Ǳ���(����Ʈ),
    �����̰����ϴ¹���)
    : ������ ���ڿ��� ������ ���ڸ� ���� �Ǵ� �����ʿ� ���ٿ���
    ���� N ���̸�ŭ�� ���ڿ��� ���� ��ȯ
    
    - STR : '���ڿ�' / ���ڿ� Ÿ�� �÷���
    ������� CHARACTER Ÿ������ ��ȯ
    
    �����̰����ϴ� ���ڴ� ���� ���� (���� ��, ���� ���ڰ� ���ٿ���!!)
    
    
*/

SELECT LPAD(EMAIL, 16)
FROM EMPLOYEE;
--> EMAIL ���ʿ� ���鹮�ڸ� �߰��Ͽ� �� 16����Ʈ¥�� ���ڿ��� ��ȯ
SELECT LPAD(EMAIL, 16, '#')
FROM EMPLOYEE;

-- �ֹι�ȣ�� ��ȸ ��, 621235-2****** (����ŷó��)
SELECT RPAD('621235-2',14,'*')
FROM DUAL; -- �� 14���� (14����Ʈ)

-- ��� ������ �ֹι�ȣ�� ����ŷó�� �ؼ� �������!!
-- 1�ܰ�. SUBSTR �Լ��� �̿��ؼ� �ֹι�ȣ ��
SELECT SUBSTR(EMP_NO, 1,8)
FROM EMPLOYEE;
-- 2�ܰ�. RPAD �� ��ø�Ͽ� �ֹι�ȣ �� 6�ڸ��� * ���̱�
SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO,1,8),14,'*') AS �ֹι�ȣ
FROM EMPLOYEE;

-- RPAD �Լ� ���̵� ����
SELECT EMP_NAME
    , SUBSTR(EMP_NO, 1,8) || '******'
    FROM EMPLOYEE;
    
------------------------------------------------------------------

/*
    LTRIM / RTRIM
    
    - LTRIM / RTRIM(STR, �����ϰ����ϴ¹���)
    : ���ڿ��� ���� �Ǵ� �����ʿ��� �����ϰ����ϴ� ���ڵ��� ã�Ƽ�
    ������ ������ ���ڿ��� ��ȯ
    
    -STR : '���ڿ�' / ���ڿ� Ÿ�� �÷���
    ������� CHARACTER Ÿ������ ��ȯ
    
    
    �����ϰ����ϴ¹��ڴ� ��������
    (������, ������ ��������!!)
    
*/

SELECT LTRIM('        K        H')
FROM DUAL;

SELECT LTRIM ('0001230456000', '0')
FROM DUAL;
--> LTRIM �� ���� ����

SELECT RTRIM('0001230456000','0')
FROM EMPLOYEE;
--> RTRIM �� ������ ����

-- ������ �� ����� �ʹٸ�??

SELECT RTRIM(LTRIM ('0001230456000', '0'),0)
FROM DUAL;

SELECT LTRIM('123123KH123','123')
FROM DUAL;

--> �����ϰ��� �ϴ� ���ڿ� ������ ���� ����

SELECT LTRIM('ACABACCKH', 'ABC')
FROM DUAL;

--> ���ڿ��� ������ �����ϴ��� ������ �����ϴ°� �ƴ϶�
-- ���� �ϳ��ϳ��� �� �����ϸ� ���Ű��ϴ¿���

---------------------------------------------------------------

/*
    TRIM
    
    - TRIM(BOTH/LEADING/TRILING '�����ϰ����ϴ¹���' FROM STR)
    : ���ڿ��� ��/��/���ʿ� �ִ� Ư�� ���ڸ� ������ ������ ���ڿ� ��ȯ
    
    - STR : '���ڿ�' / ���ڿ� Ÿ�� �÷���
    
    ������� CHARACTER Ÿ������ ��ȯ
    
    BOTH/LEADING/TRAILING �� ���� ����
    (���� ��, BOTH�� �⺻��!!)

*/

SELECT TRIM('      K    H  ')
FROM DUAL;
-- > �⺻������ ���ڿ��� �������� �� ���ʿ� �ִ� ������ ����

SELECT TRIM(/* BOTH */'Z' FROM 'ZZKHZZZ')
FROM DUAL;
-- > ���� �� BOTH�� �⺻�� (��������)

SELECT TRIM (BOTH'Z' FROM 'ZZKHZZZ')
FROM DUAL;

SELECT TRIM(LEADING 'Z' FROM 'ZZZKHZZZ')
FROM DUAL;
--> LEADING : ���ʸ� ����(== LTRIM �Լ� ���� ����� ����)


SELECT TRIM(TRAILING 'Z' FROM 'ZZZKHZZZ')
FROM DUAL;
--> TRAILING : ���ʸ� ���� (== RTRIM �Լ� ���� ����� ����)

------------------------------------------------------------

/*
    LOWRE / UPPER / INITCAP
    
    - LOWER(STR) : �� �ҹ��ڷ� ����
    - UPPER(STR) : �� �빮�ڷ� ����
    - INITCAP(STR) : �� �ܾ� �ձ۸� �빮�ڷ� ����
                     (��, �ܾ��� ������ ����)
    
    - STR : '���ڿ�' / ���ڿ� Ÿ�� �÷���
    ������� CHARACTER Ÿ������ ��ȯ
        
*/

SELECT LOWER('Welcome To My World!')
FROM DUAL;

SELECT UPPER('Welcome To My World!')
FROM DUAL;

SELECT INITCAP('welcome to my world!')
FROM DUAL;

SELECT INITCAP ('welcometomyworld!')
FROM DUAL;
--> �ܾ��� ������ ������!!

----------------------------------------------------------

/*
    CONCAT 
    
    - CONCAT(STR1, STR2)
    : ���޵� �� ���ڿ��� �ϳ��� ��ģ ����� ��ȯ
    
    
    - STR1, STR2 : '���ڿ�' / ���ڿ� Ÿ�� �÷���
    ������� CHARACTER Ÿ������ ��ȯ
    
    
*/

SELECT CONCAT('������', 'ABC')
FROM DUAL;

SELECT '������' || 'ABC'
FROM DUAL;


SELECT '������' || 'ABC' || '123'
FROM DUAL;

-- CONCAT �� �̿��� ���?
SELECT CONCAT('������', 'ABC','123')
FROM DUAL;
-- > ���� : �ΰ��� ���ڿ��� ������ ����!!

SELECT CONCAT(CONCAT('������','ABC'),'123')
FROM DUAL;

-------------------------------------------------------------------------
/*
    REPLACE
    
    - REPLACE(STR, ã������, �ٲܹ���)
    : STR �� ���� ã�� ���ڸ� ã�Ƽ� �ٲ� ���ڷ� �ٲ�
    ���ڿ��� ��ȯ
    
    - STR : '���ڿ�' / ���ڿ� Ÿ�� �÷���
    ������� CHARACTER Ÿ������ ��ȯ
*/

SELECT REPLACE('����� ������ ���ﵿ','���ﵿ', '�Ｚ��')
FROM DUAL;

-- EMPLOYEE ���̺� ����
-- ��� ����� �̸��� �ּ� �����ΰ��� 
-- 'kh.or.kr' �� 'iei.or.kr' �� �����ؼ� ��ȸ
SELECT EMP_NAME
    , EMAIL
    , REPLACE(EMAIL, 'kh.or.kr','iei.or.kr') "�ٲ� �̸���"
    FROM EMPLOYEE;

-----------------------------------------------------------

/*
    < ���ڿ� ���õ� �Լ� >
    
    ABS
    
    - ABS(NUMBER) : ���밪�� �����ִ� �Լ�
    
    
*/

SELECT ABS(-10)
FROM DUAL;


SELECT ABS(-19.2)
FROM DUAL;

---------------------------------------------------------

/*
    MOD
    
    - MOD(NUMBER1, NUMBER2)
    : �� ���� ���� ������ ���� ��ȯ���ִ� �Լ�
      (����Ŭ������ ��ⷯ ������ % �� ����!!)
      
      
*/

SELECT MOD(10,3)
FROM DUAL;

SELECT MOD(-10 , 3)
FROM DUAL;

SELECT MOD(10.9, 3)
FROM DUAL;

-----------------------------------------------------------------

/*
    ROUND
    
    - ROUND(NUMBER, ��ġ)
    : �ݿø� ó�����ִ� �Լ�
    
    ��ġ : �Ҽ��� �Ʒ� N ��° ������ �ݿø�
          ���� ���� (���� ��, �⺻���� 0)
          
*/

SELECT ROUND(123.456)
FROM DUAL; -- 123


SELECT ROUND(123.456,0)
FROM DUAL; -- 123

SELECT ROUND (123.465,1)
FROM DUAL; --123.5

SELECT ROUND (123.456, 2)
FROM DUAL; --123.46

SELECT ROUND(123.456,3)
FROM DUAL; --123.456

SELECT ROUND(123.456,4)
FROM DUAL; --123.456

SELECT ROUND(123.456,-1)
FROM DUAL; --120 ���̳ʽ����ϸ� �ݴ�� �����ڸ����� �ݿø��� ����
SELECT ROUND (123.456, -2)
FROM DUAL;
-----------------------------------------------------------------


/*
    CEIL
    
    - CEIL(NUMBER) : �Ҽ��� �Ʒ��� ���� ������ �ø� ó��
                     (�ڸ��� ���� X)
        
              
*/

SELECT CEIL(123.156)
FROM DUAL; --124

SELECT CEIL(99.000000001)
FROM DUAL;

----------------------------------------------------
/*
    FLOOR
    
    - FLOOR(NUMBER) : �Ҽ��� �Ʒ��� ���� ������ ���� ó��
                       (�ڸ��� ���� X)
*/


SELECT FLOOR(123.789)
FROM DUAL; --123


SELECT FLOOR(100.999999999)
FROM DUAL; -- 100

-- EMPLOYEE ���̺�κ���
-- �� �������� ����Ϸκ��� ���ñ����� �ٹ��ϼ� ���ϱ�
--> �ϼ� ������ ��������,
-- ��/��/�ʱ��� ���Ǽ� �ڿ� �Ҽ����� �������߾���!!

SELECT EMP_NAME
    , HIRE_DATE
    , CONCAT (FLOOR(SYSDATE - HIRE_DATE) ,'��')"�ٹ��ϼ�"
    FROM EMPLOYEE;
-----------------------------------------------------------------

/*
    TRUNC
    
    - TRUNC(NUMBER, ��ġ)
    : ��ġ ���� ������ ���� ó�� ���ִ� �Լ�
    
    ��ġ�� ���� ���� (���� ��, �⺻���� 0, �Ҽ��� �ڸ� ��� ����ó��)
    
*/
SELECT TRUNC(123.756)
FROM DUAL; -- 123


SELECT TRUNC(123.756, 0)
FROM DUAL; --123

SELECT TRUNC(123.756,1)
FROM DUAL; --123.7

SELECT TRUNC(123.756, -1)
FROM DUAL; --120
--> ���������� ��ġ���� ������ ���� ���� (�Ҽ��� ���� ��ġ ����)

----------------------------------------------------------------

/*
    < ��¥ ���� �Լ� >
    
    DATE Ÿ���� : ��, ��, ��, ��, ��, �� �� �� ������ �ڷ���
    
    - SYSDATE : ���� �� ��ǻ���� �ý��� ��¥ ��ȯ
    

*/

SELECT SYSDATE
FROM DUAL; -- 24/08/09

-- MONTHS_NETWEEN(DATE1, DATE2)
-- �� ��¥ ������ "������" ��ȯ
-- ��, DATE1 �� �� �̷��� ��¥���� �Ѵ�. **����� �̰�ʹٸ� ���̴�
-- EMPLOYEE ���̺�κ���
-- �� �������� ����Ϸκ��� ���ñ����� �ٹ��ϼ��� �ٹ������� ��ȸ
SELECT EMP_NAME
    , FLOOR(SYSDATE - HIRE_DATE) ||'��' �ٹ��ϼ�
    , FLOOR(MONTHS_BETWEEN(SYSDATE , HIRE_DATE)) || '����' �ٹ�������
    FROM EMPLOYEE;
--> ��, ��, ��, �ʿ� ���� ���굵 ���� �Ҽ����� ����!!

-- ADD_MONTHS(DATE, NUMBER)
-- Ư�� ��¥�� �ش� ���ڸ�ŭ�� �������� ���� ��¥�� ��ȯ
-- (DATE Ÿ�� ��ȯ)

-- ���� ��¥�κ��� 5���� ��
SELECT ADD_MONTHS(SYSDATE, 5)
FROM DUAL;

-- EMPLOYEE ���̺� ����
-- ��ü ������� ������, �Ի���, �Ի� �� 6������ �귶�� ���� ��¥ ��ȸ
SELECT EMP_NAME
    , HIRE_DATE
    , ADD_MONTHS(HIRE_DATE,6) ����������
 FROM EMPLOYEE;

-- NEXT_DAY(DATE, ������ ��Ÿ���°�(����/����))
-- Ư�� ��¥���� ���� ����� �ش� ������ ã�� �� ��¥�� ��ȯ
SELECT NEXT_DAY(SYSDATE, '�Ͽ���')
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, '��')
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, 1)
FROM DUAL;
-- 1 : �Ͽ���, 2 : ������, 3 : ȭ����, 4 : ������, 5 :�����, 6 : �ݿ���, 7 : �����

SELECT NEXT_DAY(SYSDATE, 5)
FROM DUAL; 
--> �ٰ����� ��¥ �� ���� ����� ������� �� ���ŷ� ������ ����!!

SELECT NEXT_DAY(SYSDATE, 'SUNDAY')
FROM DUAL;
--> ���� �ý��� �� KOREAN �̱� ������ ���� �߻�!!

-- ��� ����
ALTER SESSION SET NLS_LANGUAGE = 'AMERICAN';
SELECT NEXT_DAY(SYSDATE, 'SUNDAY')
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, '�Ͽ���')
FROM DUAL;
--> �ݴ�� �ѱ��� �ȴ�

-- ���󺹱�
ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';

SELECT NEXT_DAY(SYSDATE, '�Ͽ���')
FROM DUAL;

-- LAST_DAY(DATE)
-- �ش� Ư�� ��¥ ���� ������ ��¥�� ���ؼ� ��ȯ
-- (DATE Ÿ�� ��ȯ)
SELECT LAST_DAY(SYSDATE)
FROM DUAL;

-- ��ü ������� �̸�, �Ի���, �Ի��� ���� ������ ��¥ ��ȸ
SELECT EMP_NAME
    , HIRE_DATE
    , LAST_DAY(HIRE_DATE)
    FROM EMPLOYEE;
    
/*
    EXTRACT : �⵵ �Ǵ� �� �Ǵ� �� ������ �����ؼ� ��ȯ
              (NUMBER Ÿ�� ��ȯ)
            
    [ ǥ���� ]
    - EXTRACT(YEAR FROM DATE) : Ư�� ��¥�κ��� �⵵�� ����
    - EXTRACT(MONTH FROM DATE) : Ư�� ��¥�κ��� ���� ����
    - EXTRACT (DAY FROM DATE) : Ư�� ��¥�κ��� �ϸ� ����
            
*/

-- ���� ��¥�κ��� ���� �⵵, ��, ���� �����ؼ� ���
SELECT EXTRACT(YEAR FROM SYSDATE) -- 2024
    , EXTRACT (MONTH FROM SYSDATE) -- 8
    , EXTRACT (DAY FROM SYSDATE) -- 9
    FROM DUAL;

-- EMPLOYEE ���̺� ����
-- ��ü ������� �����, �Ի�⵵, �Ի��, �Ի��� ��ȸ
SELECT EMP_NAME
    , HIRE_DATE
    , EXTRACT(YEAR FROM HIRE_DATE)�Ի�⵵
    , EXTRACT(MONTH FROM HIRE_DATE) �Ի��
    , EXTRACT(DAY FROM HIRE_DATE) �Ի���
    , EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)�ٹ�����
    FROM EMPLOYEE
    ORDER BY �Ի�⵵ ASC, �Ի�� ASC, �Ի��� ASC;
 --------------------------------------------------------------------------
 
 /*
    < ����ȯ �Լ� >
    
    NUMBER / DATE => CHARACTER
    
    - TO_CHAR(NUMBER/DATE, ����)
    : ������ �Ǵ� ��¥�� �����͸� ������ Ÿ������ ��ȯ
     (CHARACTER Ÿ�� ��ȯ)
 --> NUMBER => CHARACTER     
*/

SELECT TO_CHAR(1234)
FROM DUAL; -- 1234 �ٲ�Ծ��µ�? => ���ڿ� '1234' �� �ٳ�

SELECT TO_CHAR(1234,'00000')
 FROM DUAL; -- 1234 => '01234' : ��ĭ�� 0���� ä��
 

SELECT TO_CHAR(1234,'99999')
FROM DUAL; -- 1234 => '1234' : ��ĭ�� �������� ä��


SELECT TO_CHAR(1234,'L00000')
FROM DUAL; -- 1234 => '\1234'
--> L : LOCAL, ���� ������ ������ ȭ����� ��ȣ
SELECT TO_CHAR(1234,'L99999')
FROM DUAL; -- 1234=> '\1234'

-- �޷���ȣ�� ����ʹٸ�?
SELECT TO_CHAR(1234, '$99999')
FROM DUAL;
-- ���� ���� �� ���� �Ǽ���������� 3�ڸ����� ,�� ����!!
SELECT TO_CHAR(1234, 'L99,999')
FROM DUAL;

-- EMPLOYEE ���̺� ����
-- �޿������� 3�ڸ�����, �� �����ؼ� ���
SELECT EMP_NAME
    , TO_CHAR(SALARY, 'L999,999,999') "�޿� ����"
    FROM EMPLOYEE;
-- DATE=> CHARACTER
SELECT SYSDATE
FROM DUAL; --24/08/09

SELECT TO_CHAR(SYSDATE)
FROM DUAL; -- 24/08/09 => '24/08/09'

-- ��¥ ��� �� ���� ����
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD')
FROM DUAL;
--> ���� ������ �⺻���� 'YY/MM/DD'

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL; -- '2024-08-09'

SELECT TO_CHAR(SYSDATE, 'PM HH:MI:SS')
FROM DUAL; -- '���� 03:20:50'
--> AM / PM : ���� / ����

SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS')
FROM DUAL; -- '15:22:28'
--> HH24 : 24�ð� ����

SELECT TO_CHAR(SYSDATE, 'MON DY, YYYY')
FROM DUAL; -- '8�� ��, 2024'
--> MON : N��
--> DY : ���� �� ����

-- ������ �پ��ϸ�, ������ �� ������!!

-- �⵵�ν� �� �� �ִ� ����
SELECT TO_CHAR(SYSDATE, 'YYYY')
    ,TO_CHAR(SYSDATE, 'RRRR')
    ,TO_CHAR(SYSDATE, 'YY')
    ,TO_CHAR(SYSDATE, 'YEAR')
    FROM DUAL;
--> YEAR�� ����� �⵵�� ��� (���縵����)

-- ���ν� �� �� �ִ� ����
SELECT TO_CHAR(SYSDATE, 'MM')
    ,  TO_CHAR(SYSDATE, 'MON')
    ,  TO_CHAR(SYSDATE, 'MONTH')
    ,  TO_CHAR(SYSDATE, 'RM')
    FROM DUAL;
--> RM : �θ����ڷ� ǥ��

--�Ϸν� �� �� �ִ� ����
SELECT TO_CHAR(SYSDATE, 'D')
     , TO_CHAR(SYSDATE, 'DD')
     , TO_CHAR(SYSDATE, 'DDD')
     FROM DUAL;
--> D : 1���� ���� ����° (�Ͽ��Ϻ��� ��)
--> DD : 1�� ���� ����° (1�Ϻ��� ��)
--> DDD : 1�� ���� ����° (1�� 1�Ϻ��� ��)

-- ���Ϸν� �� �� �ִ� ����
SELECT TO_CHAR(SYSDATE, 'DY')
     , TO_CHAR(SYSDATE, 'DAY')
     FROM DUAL;
--> DY : '����' �� �� ����
--> DAY : '����' �� ���� ����

-- 2024�� 08�� 09�� (��) �������� �����Ű�� ����
SELECT TO_CHAR(SYSDATE, 'YYYY"��" MM"��" DD"��" (DY)')
FROM DUAL;


-- EMPLOYEE ���̺� ����
-- �����, �Ի��� (���� ���� ����)
SELECT EMP_NAME
    , TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��" (DY)')
    FROM EMPLOYEE;

-- �����, �Ի��� (���� ���� ����)
-- ��, 2010�� ���Ŀ� �Ի��� ����鸸
SELECT EMP_NAME
    , TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��" (DY)')
    FROM EMPLOYEE
 WHERE EXTRACT(YEAR FROM HIRE_DATE ) >  2010;
 
--> ���� ���� �̿��� �ٸ� ���ڰ� �� ���
-- "��", "��", "��" ó�� �ֵ���ǥ�� ���ξ���!!

-----------------------------------------------------------------------
/*
    NUMBER / CHARACTER => DATE
    - TO_DATE(NUMBER/CHARACTER, ����)
    : ������ �Ǵ� ������ �����͸� ��¥������ ��ȯ
    (DATE Ÿ�� ��ȯ)
    
    
*/

SELECT TO_DATE(20210101)
FROM DUAL;

SELECT TO_DATE('20210101')
FROM DUAL;
--> �⺻ ������ YY/MM/DD

-- TO_DATE �Լ� ȣ�� �� ���� ����
SELECT TO_DATE(000101)
FROM DUAL; -- 000101 (X) / 101 (0)
--> 000101 �� 0���� �����ϴ� ���ڷ� �ν��Ͽ� ���� �߻�

SELECT TO_DATE('000101')
FROM DUAL;
--> 0���� �����ϴ� �⵵�� �ݵ�� ���ڿ��� ���� �ؾ���!!

-- ������ �����ϴ� ���
SELECT TO_DATE('20100101', 'YYYYMMDD')
FROM DUAL;

--> RESULT SET �����δ� YY/MM/DD �� ��������
-- �� ���� ��ư Ŭ�� �� ����� �� ��¥ �������� ����!!

SELECT TO_DATE('041030 143021', 'YYMMDD HH24MISS')
 FROM DUAL;

-- ��¥ ���� ��� �� ���� ����!!
SELECT TO_DATE('140630', 'YYMMDD')
FROM DUAL; -- 2014�� 6�� 30��

SELECT TO_DATE('980630', 'YYMMDD')
FROM DUAL; -- 2098�� 6�� 30��
--> TO_DATE �Լ��� �̿��ؼ� DATE �������� ��ȯ ��
-- ���ڸ� �⵵�� ���� YY ������ �����ų ���
-- "������ ���� ���� ����" ���� ����

SELECT TO_DATE('140630','RRMMDD')
FROM DUAL; -- 2014�� 6�� 30��
SELECT TO_DATE('980630', 'RRMMDD')
FROM DUAL; -- 1998�� 6�� 30��
--> R : ROUND ���� (�ݿø�)
--> ���ڸ��⵵�� ���� RR ������ ������ ���
-- 50 �̻��̸� ���������, 50 �̸��̸� ��������� ǥ��

------------------------------------------------------------
/*
    CHARACTER => NUMBER
    
    -TO_NUMBER(CHARCATER, ����)
    : ������ �����͸� ���������� ��ȯ
     (NUMBER Ÿ�� ��ȯ)

*/

-- ���ڿ��� ���ڷ� �ڵ�����ȯ �Ǳ� ��!!
SELECT '123' + '123'
FROM DUAL; -- 246
--> ���ڿ��� ���� Ÿ������ �ڵ�����ȯ �� �� ��������
SELECT *
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN (2,4);

--> ���ڿ��� Ÿ�԰��� "�����" ����

-- �ڵ�����ȯ�� �ȵǴ� Ư�����̽�

SELECT '10,000,000' + '550,000'
FROM DUAL;
--> ����(,) �� ���ԵǾ��ֱ� ������ �ڵ�����ȯ�� �ȵ�!!

SELECT TO_NUMBER('10,000,000', '99,999,999')
     + TO_NUMBER('550,000', '999,999')
     FROM DUAL;

SELECT TO_NUMBER('0123')
FROM DUAL;

-----------------------------------------------------------------------
/*
    < NULL ó�� �Լ� >
*/

-- NVL(�÷���, �ش��÷�����NULL�ϰ���ȯ�Ұ����)
-- �ش� �÷����� ������ ��� ������ �÷����� �״�� ��ȯ,
-- �ش� �÷����� NULL �� ��쿡�� ���� ������ Ư������ ��ȯ

-- EMPLOYEE ���̺�κ���
-- �����, ���ʽ� ��ȸ
-- ��, ���ʽ��� �ȹ޴� ��� NULL �� �ƴ϶� 0 ���� ���
SELECT EMP_NAME, BONUS, NVL(BONUS, 0)
FROM EMPLOYEE;

-- ���ʽ� ���� ������ ����� ��ȸ ������
SELECT EMP_NAME
     , SALARY
     , BONUS
     , (SALARY + NVL(BONUS, 0) * SALARY) *12 "���ʽ� ���� ����"
     FROM EMPLOYEE;
-- ����� , �μ��ڵ� ��ȸ
-- ��, �μ��ڵ尡 NULL �� ��� '�μ� ��ġ ����' ���� ���
SELECT EMP_NAME
     , NVL(DEPT_CODE, '�μ� ��ġ ����')
    FROM EMPLOYEE;
    
-- NVL2(�÷���, �����1, �����2)
-- �ش� �÷����� �����Ұ�� �����1�� ��ȯ
-- �ش� �÷����� �������� ������� (NULL) �� ��� �����2 �� ��ȯ

-- ���ʽ��� �޴� ����� '���ʽ� ����'
-- ���ʽ��� ���� �ʴ� ����� '���ʽ� ���� ����' ���� ��ȸ
SELECT EMP_NAME
     , BONUS
     , NVL2(BONUS, '���ʽ� ����', '���ʽ� ���� ����')
    FROM EMPLOYEE;
    
-- �μ��ڵ尡 �ִ� ��� '�μ� ��ġ �Ϸ�'
-- �μ��ڵ尡 ���� ��� '�μ� ��ġ ����'
SELECT EMP_NAME
     , DEPT_CODE
     , NVL2(DEPT_CODE, '�μ� ��ġ �Ϸ�', '�μ� ��ġ ����')
     FROM EMPLOYEE;
     
     
SELECT EMP_NAME
     , manager_id
     , NVL2(manager_id, '�λ�� ����', '�λ������')
     FROM EMPLOYEE;
     
-- NULLIF(�񱳴��1, �񱳴��2)
-- �񱳴��1 = �񱳴��2 �� ��ġ�� ��� NULL ��ȯ
-- �񱳴��1 = �񱳴��2 �� ��ġ���� ���� ��� �񱳴��1 ��ȯ
SELECT NULLIF('123','123')
FROM DUAL;
SELECT NULLIF('123','456')
FROM DUAL;
-----------------------------------------------------------

/*
    < ���� �Լ� >
    
    DECODE(�񱳴���÷���, ���ǰ�1, �����1
                        , ���ǰ�2, �����2
                        , ���ǰ�3, �����3
                        , .......
                        , ���ǰ�N, �����N
                        , �����)
                        
    -�ڹٿ����� SWITCH ���� ������ ����
    switch(����񱳴����){
    case ���ǰ�1 : �����1 break;
    case ���ǰ�2 : �����2 break;
    ...
    default : �����
    
    }

*/
-- EMPLOTEE ���̺�κ���
-- ���, �����, �ֹι�ȣ, ���� ('��' / '��')��ȸ
SELECT EMP_ID
     , EMP_NAME
     , EMP_NO
     , SUBSTR(EMP_NO, 8, 1) "����"
     , DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '2','��')"����2"
     FROM EMPLOYEE;
     
-- �������� �޿��� �λ���Ѽ� ��ȸ
-- �����ڵ尡 'J7' �� ����� �޿��� 10% �λ��ؼ�
--          'J6' �� ����� �޿��� 15% �λ��ؼ�
--          'J5' �� ����� �޿��� 20% �λ��ؼ�
-- �� �̿��� ������� �޿��� 5% �λ��ؼ� ��ȸ
SELECT EMP_NAME
     , JOB_CODE
     , SALARY "�λ� ��"
     , DECODE (JOB_CODE,'J7',SALARY*1.1,'J6',SALARY*1.15,'J5',SALARY*1.2,SALARY*1.05)"�λ� ��"
     FROM EMPLOYEE;
--------------------------------------


/*
(�Լ��� �ƴ�)
    CASE WHEN THEN ����
    - DECODE �����Լ��� ���ϸ� DECODE ���������� "�����"�� ����
     CASE WHEN THEN �������δ� Ư�� ������ "������" �ϰ� ���� ����
    - �ڹٿ����� IF-ELSE IF�� ����
[ ǥ���� ]
 CASE WHEN ���ǽ�1 THEN �����1
      WHEN ���ǽ�2 THEN �����2
      ...
      WHEN ���ǽ�N THEN �����N
                  ELSE �����
                  
    END
*/    
-- ���, �����, ���� ��ȸ : DECODE �Լ�
SELECT EMP_ID
    , EMP_NAME
    , DECODE(SUBSTR(EMP_NO, 8, 1), '1' ,'��'
                                  , '2' ,'��'
                                  , '3' ,'��'
                                  , '4' ,'��') "����"
            
FROM EMPLOYEE;

-- CASE WHEN THEN ����
SELECT EMP_ID
     , EMP_NAME ,CASE WHEN SUBSTR(EMP_NO, 8, 1)='1' THEN '��'
                WHEN SUBSTR(EMP_NO, 8, 1)='2' THEN '��'
                WHEN SUBSTR(EMP_NO, 8, 1)='3' THEN '��'
                WHEN SUBSTR(EMP_NO, 8, 1)='4' THEN '��'
                END"����"
   
FROM EMPLOYEE;

-- ���ǽ� ���
SELECT EMP_ID
    , EMP_NAME
    , CASE WHEN SUBSTR(EMP_NO, 8 ,1) �� IN('1', '3') THEN '��'
                                           ELSE '��'
                                           END "����"
FROM EMPLOYEE;
-- �������� �޿��� �λ���Ѽ� ��ȸ
-- �����ڵ尡 'J7' �� ����� �޿��� 10% �λ��ؼ�
--          'J6' �� ����� �޿��� 15% �λ��ؼ�
--          'J5' �� ����� �޿��� 20% �λ��ؼ�
-- �� �̿��� ������� �޿��� 5% �λ��ؼ� ��ȸ
SELECT EMP_NAME
     , JOB_CODE
     , SALARY "�λ� ��"
     , CASE WHEN JOB_CODE = 'J7'  THEN SALARY * 1.1
            WHEN JOB_CODE = 'J6'  THEN SALARY * 1.15
            WHEN JOB_CODE = 'J5'  THEN SALARY * 1.2
                                  ELSE SALARY * 1.05
                                  
     END "�λ� ��"
     FROM EMPLOYEE;
     
-- �����, �޿�, �޿���� (���,�߱�,�ʱ�)
-- SALARY ���� 500���� �ʰ��� ��� '���'
--            500 ���� ���� 350 ���� �ʰ��� ��� '�߱�'
--            350 ���� ������ ��� '�ʱ�'
SELECT EMP_NAME
     , SALARY
     , CASE WHEN SALARY > 5000000 THEN '���'
            WHEN SALARY <= 5000000
            AND SALARY > 3500000 THEN '�߱�'
            -- WHEN SALARY <= 3500000 THEN '�ʱ�'
                                        ELSE '�ʱ�'
        END AS "�޿� ���"

  FROM EMPLOYEE;
--> ���� ���� ����񱳰� �ƴ� ���ǽ��� ��쿡��
--  DECODE �����Լ� ��� �Ұ�!!
  
--> DECODE �Լ� ������ CASE WHEN THEN �������� ���� ����
