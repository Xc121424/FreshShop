package com.school.ssm.service;

import com.school.ssm.po.Receiver;
import com.school.ssm.service.base.IBaseService;

import java.util.List;

public interface IReceiverService extends IBaseService<Receiver> {

    void save(Receiver receiver);

    void delete(int rid);

    List<Receiver> findAll(Integer uuid);

    void setDefaultAddress(int uuid, int rid);
}
