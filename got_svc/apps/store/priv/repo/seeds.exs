#
alias Store.Repo
alias Store.Castle
alias Store.Minion

Repo.delete_all(Castle)
Repo.delete_all(Minion)

Repo.insert! %Castle{
  name:        "DragonStone",
  description: "Blackwater Bay. House of Targaryen."
}
Repo.insert! %Castle{
  name:        "Castle Black",
  description: "Kingsroad. Night's watch headquaters."
}
Repo.insert! %Castle{
  name:        "Red Keep",
  description: "King's landing. Residence for king of the Andals and the First Men."
}

cast = [
  "Jon Snow",
  "Daenarys Targarien",
  "Melisandre",
  "Tyrion Lanister",
  "Sansa Stark",
  "Khal Drogo"
]

Enum.each( Enum.with_index(cast), fn({c, index}) ->
    Repo.insert! %Minion{name: c, avatar: "m#{index+1}"}
end)
