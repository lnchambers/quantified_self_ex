# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SelfQuantifiedEx.Repo.insert!(%SelfQuantifiedEx.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

SelfQuantifiedEx.Api.create_food(%{name: "Opakawagalaga's Pawpaws", calories: 2000})
SelfQuantifiedEx.Api.create_food(%{name: "Eupanifahorious Mints", calories: 30})
SelfQuantifiedEx.Api.create_food(%{name: "Froot Snax 100% Yolo Swag", calories: 51000})
