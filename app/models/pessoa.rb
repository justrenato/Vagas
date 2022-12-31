class Pessoa < ApplicationRecord
	has_many :candidaturas
	LEVELS = {
		1 => 'estagiario',
		2 => 'junior',
		3 => 'pleno',
		4 => 'senior',
		5 => 'especialista'
	}
end
