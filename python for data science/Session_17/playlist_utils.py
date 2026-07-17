def add_song(playlist, song):
    playlist.append(song)
    return playlist

import playlist_utils

playlist = []

playlist_utils.add_song(playlist, "Shape of You")
playlist_utils.add_song(playlist, "Blinding Lights")
playlist_utils.add_song(playlist, "Believer")

print("Final Playlist:", playlist)