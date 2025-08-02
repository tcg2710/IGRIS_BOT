from SaitamaRobot.sample_config import Config

class Development(Config):
    OWNER_ID = 5969684674  # your telegram ID
    OWNER_USERNAME = "khoonkhardevils"  # your telegram username
    TOKEN = "6834532674:AAEpAlwzL84xk7Y6sDpfHIoyGFVrYQlisNs"  # your api key, as provided by the @botfather
    API_ID = 22344126
    API_HASH = "1412fdbec0c9cc1b3b2ed87542b2e11a"
    SQLALCHEMY_DATABASE_URI = 'postgresql://igrisuser:igrispass@localhost:5432/igrisdb'  # sample db credentials
    JOIN_LOGGER = '-1001218284362' # some group chat that your bot is a member of
    USE_JOIN_LOGGER = True
    SUDO_USERS = [18673980, 83489514]  # List of id's for users which have sudo access to the bot.
    LOAD = []
    NO_LOAD = ['translation']
