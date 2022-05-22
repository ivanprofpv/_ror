class CargoTrain < Train

def initialize(type_train)
	@type_train = cargo
	@trains[train_number] = { type_train: type_train }
end

end



git remote add orogin git@github.com:ivanprofpv/learning_ror