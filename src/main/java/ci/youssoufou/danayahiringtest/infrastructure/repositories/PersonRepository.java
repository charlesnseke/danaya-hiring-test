package ci.youssoufou.danayahiringtest.infrastructure.repositories;

import ci.youssoufou.danayahiringtest.infrastructure.entities.PersonEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PersonRepository extends JpaRepository<PersonEntity, Long> {
    List<PersonEntity> findByIdentity(final @Param("identity") String identity);
}
