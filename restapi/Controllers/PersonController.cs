using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace restapi.Controllers
{

  /// <summary>
  /// Represents a person with Id, FirstName, LastName, and Age properties.
  /// </summary>
  public class PersonModel
  {
    /// <summary>
    /// Gets or sets the Id of the person.
    /// </summary>
    public int Id { get; set; }

    /// <summary>
    /// Gets or sets the first name of the person.
    /// </summary>
    public string? FirstName { get; set; }

    /// <summary>
    /// Gets or sets the last name of the person.
    /// </summary>
    public string? LastName { get; set; }

    /// <summary>
    /// Gets or sets the age of the person.
    /// </summary>
    public int Age { get; set; }
  }

  /// <summary>
  /// API Controller for managing persons.
  /// </summary>
  [ApiController]
  [Authorize]
  [Route ("[controller]")]
  public class PersonController : ControllerBase
  {
    private static List<PersonModel> List = new List<PersonModel> ()
    {

      new PersonModel { Id = 1, FirstName = "John", LastName = "Doe", Age = 25 },
      new PersonModel { Id = 2, FirstName = "Jane", LastName = "Doe", Age = 30 },
      new PersonModel { Id = 3, FirstName = "Alice", LastName = "Smith", Age = 35 },
      new PersonModel { Id = 4, FirstName = "Bob", LastName = "Smith", Age = 40 },
      new PersonModel { Id = 5, FirstName = "Charlie", LastName = "Brown", Age = 45 },
      new PersonModel { Id = 6, FirstName = "Daisy", LastName = "Brown", Age = 50 },
      new PersonModel { Id = 7, FirstName = "Eve", LastName = "Johnson", Age = 55 }
    };

    private readonly ILogger<PersonController> _logger;

    /// <summary>
    /// Initializes a new instance of the <see cref="PersonController"/> class.
    /// </summary>
    /// <param name="logger">The logger instance.</param>
    public PersonController (ILogger<PersonController> logger)
    {
      _logger = logger;
    }

    /// <summary>
    /// Gets the list of all persons.
    /// </summary>
    /// <returns>A list of <see cref="PersonModel"/>.</returns>
    [HttpGet ("")]
    public ActionResult<IEnumerable<PersonModel>> Get ()
    {
      return Ok (List);
    }

    /// <summary>
    /// Gets a person by Id.
    /// </summary>
    /// <param name="id">The Id of the person.</param>
    /// <returns>The <see cref="PersonModel"/> with the specified Id.</returns>
    [HttpGet ("{id}")]
    public ActionResult<PersonModel> Get (int id)
    {
      var person = List.FirstOrDefault (p => p.Id == id);
      if (person == null)
      {
        return NotFound ();
      }
      return Ok (person);
    }

    /// <summary>
    /// Adds a new person to the list.
    /// </summary>
    /// <param name="person">The <see cref="PersonModel"/> to add.</param>
    /// <returns>The created <see cref="PersonModel"/>.</returns>
    [HttpPost ("")]
    public ActionResult<PersonModel> Post ([FromBody] PersonModel person)
    {
      List.Add (person);
      return Created ($"/person/{person.Id}", person);
    }

    /// <summary>
    /// Updates an existing person.
    /// </summary>
    /// <param name="id">The Id of the person to update.</param>
    /// <param name="person">The updated <see cref="PersonModel"/>.</param>
    /// <returns>The updated <see cref="PersonModel"/>.</returns>
    [HttpPut ("{id}")]
    public ActionResult<PersonModel> Put (int id, [FromBody] PersonModel person)
    {
      var existingPerson = List.FirstOrDefault (p => p.Id == id);
      if (existingPerson == null)
      {
        return NotFound ();
      }
      existingPerson.FirstName = person.FirstName;
      existingPerson.LastName = person.LastName;
      existingPerson.Age = person.Age;
      return Ok (existingPerson);
    }

    /// <summary>
    /// Deletes a person by Id.
    /// </summary>
    /// <param name="id">The Id of the person to delete.</param>
    /// <returns>An <see cref="ActionResult"/> indicating the result of the operation.</returns>
    [HttpDelete ("{id}")]
    public ActionResult Delete (int id)
    {
      var existingPerson = List.FirstOrDefault (p => p.Id == id);
      if (existingPerson == null)
      {
        return NotFound ();
      }
      List.Remove (existingPerson);
      return Ok ();
    }
  }
}
