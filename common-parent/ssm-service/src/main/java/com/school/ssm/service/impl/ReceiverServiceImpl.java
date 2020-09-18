package com.school.ssm.service.impl;

import com.school.ssm.po.Receiver;
import com.school.ssm.service.IReceiverService;
import com.school.ssm.service.base.BaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ReceiverServiceImpl extends BaseServiceImpl<Receiver> implements IReceiverService {

    @Override
    public List<Receiver> findAll() {
        return receiverMapper.findAll();
    }

    @Override
    public Receiver findById(Integer id) {
        return receiverMapper.findById(id);
    }

    @Override
    public Receiver findByUUID(int uuid) {
        return null;
    }

    @Override
    public void deleteByT(Receiver receiver) {

    }

    @Override
    public void deleteByUUID(int uuid) {

    }

    @Override
    public void update(Receiver receiver) {
        receiverMapper.update(receiver);
    }

    @Override
    public void insert(Receiver receiver) {
        receiverMapper.insert(receiver);
    }

    @Override
    public void save(Receiver receiver) {
        Integer rid = receiver.getRid();
        if (rid == null) {
            insert(receiver);
        } else {
            update(receiver);
        }
    }

    @Override
    public void delete(int rid) {
receiverMapper.deleteByRid(rid);
    }

    @Override
    public List<Receiver> findAll(Integer uuid) {
        return receiverMapper.findAll(uuid);
    }

    @Override
    public void setDefaultAddress(int uuid, int rid) {
  receiverMapper.updateStateByUUid(uuid);
        Receiver newReceiver = receiverMapper.findById(rid);
        newReceiver.setState("1");
        receiverMapper.update(newReceiver);

    }
}
