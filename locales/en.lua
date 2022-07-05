local Translations = {
    error = {
        negative = 'Selling a negative?',
        no_items = 'You do not have this amount of the item you are selling',
    },
    success = {
        sold = 'You have sold %{value2} many %{value}s for a total of $%{value3}',
    },
    info = {
        sell = 'Sell Items',
        sell_pawn = 'Sell Items To The Pawn Shop',
        sell_items = 'We are paying $%{value} per item!',
        back = '⬅ Go Back',
        max = 'You currently hold %{value} of these.',
        submit = 'Exchange',
        title = 'Zain\'s Second Hand Parts',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})