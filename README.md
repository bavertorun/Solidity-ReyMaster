ReyMaster Voting Contract
=========================

This Solidity smart contract, `ReyMaster`, implements a simple voting system. It allows an owner to create an election, add candidates, authorize voters, and collect votes. After the voting period ends, the owner can retrieve the election results to determine the winning candidate. The contract is written in Solidity and designed to run on Ethereum-compatible blockchains.

  ![](https://i.hizliresim.com/7c4qudc.png)

Contract Details
----------------

### Structs

*   **Candidate**: Represents a candidate in the election.
    *   `id`: The unique identifier for the candidate.
    *   `name`: The name of the candidate.
    *   `voteCount`: The total number of votes received by the candidate.
*   **Voter**: Represents a voter in the election.
    *   `authorized`: A boolean indicating whether the voter is authorized to vote.
    *   `vote`: The candidate ID that the voter voted for.
    *   `voted`: A boolean indicating whether the voter has already voted.

### State Variables

*   **owner**: The address of the contract owner who has special permissions (e.g., to add candidates and authorize voters).
*   **electionName**: The name of the election.
*   **voters**: A mapping from voter addresses to `Voter` structs, keeping track of voter details.
*   **candidates**: An array of `Candidate` structs representing the candidates in the election.
*   **totalVotes**: The total number of votes cast in the election.

### Modifiers

*   **OnlyOwner**: Restricts certain functions so that only the contract owner can call them.

### Events

*   **Winner**: Emitted when the election results are retrieved, containing the name and vote count of the winning candidate.

### Functions

*   **constructor(string memory \_electionName)**: Initializes the contract with the election name and sets the contract deployer as the owner.
*   **addCandidate(string memory \_name)**: Allows the owner to add a new candidate to the election.
*   **authorized(address \_voter)**: Allows the owner to authorize a voter to vote.
*   **vote(uint \_candidateID)**: Allows an authorized voter to cast their vote for a candidate. The voter can only vote once.
*   **electionResult() public OnlyOwner view returns(Candidate memory)**: Allows the owner to retrieve the election results and determine the winning candidate. It iterates through all candidates to find the one with the highest vote count and returns the `Candidate` struct of the winner.

### Example Usage

1.  **Deploy the Contract**: The owner deploys the contract with a name for the election.
2.  **Add Candidates**: The owner adds candidates to the election using the `addCandidate` function.
3.  **Authorize Voters**: The owner authorizes voters using the `authorized` function.
4.  **Voting**: Authorized voters cast their votes using the `vote` function.
5.  **Retrieve Results**: The owner calls the `electionResult` function to get the winning candidate.

This contract is designed to be straightforward and ensures that only authorized voters can vote, each voter can vote only once, and the election results are accurate.
