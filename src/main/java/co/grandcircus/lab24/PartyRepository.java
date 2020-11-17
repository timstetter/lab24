package co.grandcircus.lab24;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;



public interface PartyRepository extends JpaRepository<Party, Long> {

	List<Party> findByOrderByDateAsc();
}
