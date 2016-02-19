package com.chenlm.jpa;

import com.chenlm.jpa.model.Attachment;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
 * 持久层接口
 *
 * @author liuyt
 * @date 2014-10-30 下午2:09:48
 */
@Repository
public interface IAttachmentDao extends PagingAndSortingRepository<Attachment, Long> {
}