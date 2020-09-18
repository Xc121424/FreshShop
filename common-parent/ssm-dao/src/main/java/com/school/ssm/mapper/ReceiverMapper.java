package com.school.ssm.mapper;

import com.school.ssm.mapper.base.BaseMapper;
import com.school.ssm.po.Favorities;
import com.school.ssm.po.Receiver;

import java.util.List;

public interface ReceiverMapper extends BaseMapper<Receiver> {
    void deleteByRid(int rid);

    List<Receiver> findAll(Integer uuid);

    void updateStateByUUid(int uuid);
}
