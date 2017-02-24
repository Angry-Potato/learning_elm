# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LearningElm.Repo.insert!(%LearningElm.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
LearningElm.Repo.insert!(%LearningElm.Seat{seat_no: 1, occupied: true})
LearningElm.Repo.insert!(%LearningElm.Seat{seat_no: 2, occupied: true})
LearningElm.Repo.insert!(%LearningElm.Seat{seat_no: 3, occupied: false})
LearningElm.Repo.insert!(%LearningElm.Seat{seat_no: 4, occupied: false})
LearningElm.Repo.insert!(%LearningElm.Seat{seat_no: 5, occupied: false})
LearningElm.Repo.insert!(%LearningElm.Seat{seat_no: 6, occupied: false})
LearningElm.Repo.insert!(%LearningElm.Seat{seat_no: 7, occupied: false})
LearningElm.Repo.insert!(%LearningElm.Seat{seat_no: 8, occupied: false})
LearningElm.Repo.insert!(%LearningElm.Seat{seat_no: 9, occupied: false})
LearningElm.Repo.insert!(%LearningElm.Seat{seat_no: 10, occupied: false})
LearningElm.Repo.insert!(%LearningElm.Seat{seat_no: 11, occupied: false})
LearningElm.Repo.insert!(%LearningElm.Seat{seat_no: 12, occupied: false})
