@request.restful()
def api():
    response.view = 'generic.json'
    response.headers['Content-Type'] = 'application/json; charset=utf-8'

    def GET(*args, **kwargs):
        return dict(leaderboard=db().select(db.score_history.ALL, orderby=~db.score_history.points))

    def POST(*args, **kwargs):
        score_id=db.score_history.insert(**kwargs)
        leaderboard = db().select(db.score_history.ALL, orderby=~db.score_history.points)

        position = 0
        for score in leaderboard:
            position += 1
            if score.id == score_id:
                break

        return dict(score_id=score_id, position=position)

    return locals()