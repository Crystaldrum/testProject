

select * from MP_KAPTCODE where emd_nm='세종로';
delete from mp_kaptcode where emd_nm='세종로';
commit;
select kaptcode from mp_kaptcode where emd_nm='삼성동'