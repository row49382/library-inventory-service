package com.row49382.repository;

import com.row49382.domain.Book;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;

@RepositoryRestResource
@Repository
public interface BookRepository extends CrudRepository<Book, Long> { }
