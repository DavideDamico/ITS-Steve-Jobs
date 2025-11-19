class TokenBlacklist {
  constructor(id, token, userId, blacklistedAt, expiresAt) {
    this.id = id;
    this.token = token;
    this.userId = userId;
    this.blacklistedAt = blacklistedAt;
    this.expiresAt = expiresAt;
  }
}

module.exports = TokenBlacklist;
